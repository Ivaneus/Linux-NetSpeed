Font_Black="\033[30m"
Font_Red="\033[31m"
Font_Green="\033[32m"
Font_Yellow="\033[33m"
Font_Blue="\033[34m"
Font_Purple="\033[35m"
Font_SkyBlue="\033[36m"
Font_White="\033[37m"
Font_Suffix="\033[0m"
while getopts ":I:" optname; do
    case "$optname" in
    "I")
        iface="$OPTARG"
        useNIC="--interface $iface"
        ;;
    ":")
        echo "Unknown error while processing options"
        exit 1
        ;;
    esac

done
if [ -z "$iface" ]; then
    useNIC=""
fi
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"
ipv4=$(curl -s "http://api4.ipify.org")
country=$(curl -s "http://ip-api.com/line/${ipv4}?fields=country")
city=$(curl -s "http://ip-api.com/line/${ipv4}?fields=city")
isp=$(curl -s "http://ip-api.com/line/${ipv4}?fields=isp")
countryCode=$(curl -s "http://ip-api.com/line/${ipv4}?fields=countryCode")
if [[ "$region" = "GB" ]]; then
   region="UK"
fi

whois=$(curl -4 https://rdap.db.ripe.net/ip/$ipv4 | grep -oP '(?<=country" : ")(.*?)(?=",)')

function Tiktok_Region_Checker(){
    echo  -e "${Font_SkyBlue} Welcome to using Tiktok Region Checker !${Font_Suffix}";
    echo  -e "-----------------------------------------";
    echo  -e " Your IP Information";
    echo  -e " IP Address: ${Font_Green}${ipv4}${Font_Suffix}";
    echo  -e " Country: ${Font_Green}${country}${Font_Suffix}";
    echo  -e " City: ${Font_Green}${city}${Font_Suffix}";
    echo  -e " ISP Provider: ${Font_Green}${isp}${Font_Suffix}";
    echo  -e " IP CountryCode: ${Font_SkyBlue}${countryCode}${Font_Suffix}";    
    echo  -e " Whois IP Region: ${Font_Green}${whois}${Font_Suffix}";
    if [[ "$whois" != "$countryCode" ]]; then
    echo  -e "${Font_Yellow} Mention: Your IP Possible Not Original Address!${Font_Suffix}";
    else
    echo  -e "${Font_Yellow} Mention: Your IP Perfectyl Is Original Address!${Font_Suffix}";
    fi   
    echo  -e "-----------------------------------------";
    echo  -e "${Font_Yellow} Tiktok Region Checking${Font_Suffix}";
    echo  -e " Please Wait Patiently...";

    local Ftmpresult=$(curl -${1} --user-agent "${UA_Browser}" -s --max-time 10 "https://www.tiktok.com/")
    echo $Ftmpresult
	if [[ "$Ftmpresult" = "curl"* ]]; then
		echo -e "\r Tiktok Region:\t\t${Font_Red}Failed (Network Connection Problem)${Font_Suffix}"
		echo "Region check failed, Please ensure your network is up and try again!"	
		echo -e "-----------------------------------------"
		echo -e " Author: ${Font_Blue} ivaneus (Wechat ID)${Font_Suffix}";
	        echo -e "${Font_SkyBlue} If you need any service of tiktok, please contact author!${Font_Suffix}"	
		return;
	fi	
	local FRegion=$(echo $Ftmpresult | grep '"region":"' | sed 's/.*"region//' | cut -f3 -d'"')
    if [[ "$FRegion" = "GB" ]]; then
       FRegion="UK"
    fi
    if [ -n "$FRegion" ];then
        echo -e "\r Tiktok Region:\t${Font_Green}${FRegion} (Great Tiktok IP)${Font_Suffix}"      
        echo -e "-----------------------------------------"
        echo -e " Author: ${Font_Blue} ivaneus (Wechat ID)${Font_Suffix}";               
        echo -e "${Font_SkyBlue} If you need any service of tiktok, please contact author!${Font_Suffix}"
        return;
	fi
	local STmpresult=$(curl -${1} --user-agent "${UA_Browser}" -s --max-time 10 -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Accept-Encoding: gzip" -H "Accept-Language: en"  "https://www.tiktok.com/" | gunzip 2> /dev/null)
	local SRegion=$(echo $STmpresult | grep '"region":"' | sed 's/.*"region//' | cut -f3 -d'"')
	if [ -n "$SRegion" ];then
        echo -e "\r Tiktok Region:\t${Font_Yellow}${SRegion} (Possible Already Abused)${Font_Suffix}"
        echo -e "-----------------------------------------"
        echo -e " Author: ${Font_Blue} ivaneus (Wechat ID)${Font_Suffix}";
        echo -e "${Font_SkyBlue} If you need any service of tiktok, please contact author!${Font_Suffix}"
        return;
	else	
		echo -n -e "\r Tiktok Region:\t\t${Font_Red}Failed(Tiktok Block/Unrecognized Your IP )${Font_Suffix}"
		echo " Region check failed, Please ensure your network is up and try again!"
		echo -e "-----------------------------------------"
		echo -e " Author: ${Font_Blue} ivaneus (Wechat ID)${Font_Suffix}";
		echo -e "${Font_SkyBlue} If you need any service of tiktok, please contact author!${Font_Suffix}"	
		return;
    fi
    
}
Tiktok_Region_Checker 4
