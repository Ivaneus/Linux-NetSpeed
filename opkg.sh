#!/bin/sh /etc/rc.common
opkg update
opkg install boost
opkg install boost-system
opkg install boost-date_time
opkg install boost-program_options
opkg install coreutils-base64
opkg install coreutils-nohup
opkg install libltdl7
opkg install liblua5.1.5
opkg install liblua5.3-5.3
opkg install unzip
opkg install wget
rm -rf /tmp/yilai
make dir -p /tmp/yilai
cd /tmp/yilai
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep brook | grep -v luci-app) -o brook.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep chinadns-ng | grep -v luci-app) -o chinadns-ng.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep dns2socks | grep -v luci-app) -o dns2socks.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep ipt2socks | grep -v luci-app) -o ipt2socks.ipk
curl https://mirrors.cloud.tencent.com/openwrt/releases/packages-22.03/x86_64/packages/$(curl -L -s https://mirrors.cloud.tencent.com/openwrt/releases/packages-22.03/x86_64/packages | grep -oP '(?<=a href=").*(?=">)' | grep kcptun-client | grep -v luci-app) -o kcptun-client.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep microsocks | grep -v luci-app) -o microsocks.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep naiveproxy | grep -v luci-app) -o naiveproxy.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep pdnsd-alt | grep -v luci-app) -o pdnsd-alt.ipk
curl https://mirrors.cloud.tencent.com/openwrt/releases/packages-22.03/x86_64/packages/$(curl -L -s https://mirrors.cloud.tencent.com/openwrt/releases/packages-22.03/x86_64/packages | grep -oP '(?<=a href=").*(?=">)' | grep shadowsocks-libev-ss-server | grep -v luci-app)  -o  shadowsocks-libev-ss-server.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep shadowsocksr-libev-ssr-local | grep -v luci-app) -o shadowsocksr-libev-ssr-local.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep shadowsocksr-libev-ssr-nat | grep -v luci-app) -o shadowsocksr-libev-ssr-nat.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep shadowsocksr-libev-ssr-redir | grep -v luci-app) -o shadowsocksr-libev-ssr-redir.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep shadowsocksr-libev-ssr-server | grep -v luci-app) -o shadowsocksr-libev-ssr-server.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep simple-obfs_) -o simple-obfs.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep ssocks_ | grep -v luci-app) -o ssocks.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep ssocksd | grep -v luci-app) -o ssocksd.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep tcping | grep -v luci-app) -o tcping.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep trojan-go_) -o trojan-go.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep trojan-plus_) -o trojan-plus.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep trojan_) -o trojan.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep v2ray-core | grep -v luci-app) -o v2ray-core.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep v2ray-plugin | grep -v luci-app) -o v2ray-plugin.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep xray-core | grep -v luci-app) -o xray-core.ipk
curl https://op.supes.top/packages/x86_64/$(curl -L -s https://op.supes.top/packages/x86_64 | grep -oP '(?<=a href=").*(?=" title)' | grep xray-plugin | grep -v luci-app) -o xray-plugin.ipk
opkg install *.ipk

curl https://op.supes.top/packages/x86_64/luci-app-passwall_git-22.132.45013-7afe675_all.ipk -o /tmp/luci-passwall.ipk
opkg install /tmp/luci-passwall.ipk

