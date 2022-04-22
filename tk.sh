#!/bin/bash
shopt -s expand_aliases
Font_Black="\033[30m"
Font_Red="\033[31m"
Font_Green="\033[32m"
Font_Yellow="\033[33m"
Font_Blue="\033[34m"
Font_Purple="\033[35m"
Font_SkyBlue="\033[36m"
Font_White="\033[37m"
Font_Suffix="\033[0m"

while getopts ":I:M:E:X:" optname; do
	case "$optname" in
	"I")
		iface="$OPTARG"
		useNIC="--interface $iface"
		;;
	"M")
		if [[ "$OPTARG" == "4" ]]; then
			NetworkType=4
		elif [[ "$OPTARG" == "6" ]]; then
			NetworkType=6
		fi
		;;
	"E")
		language="e"
		;;
	"X")
		XIP="$OPTARG"
		xForward="--header X-Forwarded-For:$XIP"
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

if [ -z "$XIP" ]; then
	xForward=""
fi

if ! mktemp -u --suffix=RRC &>/dev/null; then
	is_busybox=1
fi

UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"

function MediaUnlockTest_Tiktok_Region(){
    echo "Welcome to using Tiktok Region Checker !";
    echo -n -e " Tiktok Region:\t\t\t\t->\c";
    
    local Ftmpresult=$(curl $useNIC -${1} --user-agent "${UA_Browser}" -s --max-time 10 "https://www.tiktok.com/")

	if [[ "$Ftmpresult" = "curl"* ]]; then
		echo -n -e "\r Tiktok Region:\t\t\t\t${Font_Red}Failed (Network Connection Problem)${Font_Suffix}\n"
		return;
	fi	
	local FRegion=$(echo $Ftmpresult | grep '"$region":"' | sed 's/.*"$region//' | cut -f3 -d'"')
    if [[ "$FRegion" = "GB" ]]; then
       FRegion="UK"
    fi
    if [ -n "$FRegion" ];then
        echo -n -e "\r Tiktok Region:\t\t\t\t${Font_Green}${FRegion}${Font_Suffix}\n"
        return;
	fi

	local STmpresult=$(curl $useNIC -${1} --user-agent "${UA_Browser}" -s --max-time 10 -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9" -H "Accept-Encoding: gzip" -H "Accept-Language: en"  "https://www.tiktok.com" | gunzip 2> /dev/null)
	local SRegion=$(echo $STmpresult | grep '"$region":"' | sed 's/.*"$region//' | cut -f3 -d'"')
	if [ -n "$SRegion" ];then
        echo -n -e "\r Tiktok Region:\t\t\t\t${Font_Yellow}${SRegion} (Possible IDC IP)${Font_Suffix}\n"
        return;
	else	
		echo -n -e "\r Tiktok Region:\t\t\t\t${Font_Red}Failed(Tiktok Block/Unrecognized Your IP)${Font_Suffix}\n"
		return;
    fi

}
MediaUnlockTest_Tiktok_Region 4
