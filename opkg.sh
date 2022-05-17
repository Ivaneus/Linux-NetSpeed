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
wget https://op.supes.top/packages/x86_64/brook_20210701-22__x86_64.ipk
wget https://op.supes.top/packages/x86_64/chinadns-ng_1.0-beta.25-20__x86_64.ipk
wget https://op.supes.top/packages/x86_64/dns2socks_2.1-10__x86_64.ipk
wget https://op.supes.top/packages/x86_64/ipt2socks_1.1.3-12__x86_64.ipk
wget https://op.supes.top/packages/x86_64/kcptun-client_20210922-10__x86_64.ipk
wget https://op.supes.top/packages/x86_64/microsocks_1.0.2-20__x86_64.ipk
wget https://op.supes.top/packages/x86_64/naiveproxy_97.0.4692.71-2-49__x86_64.ipk
wget https://op.supes.top/packages/x86_64/pdnsd-alt_1.2.9b-par-18__x86_64.ipk
wget https://op.supes.top/packages/x86_64/shadowsocks-libev-ss-server_3.3.5-5__x86_64.ipk
wget https://op.supes.top/packages/x86_64/shadowsocksr-libev-ssr-local_2.5.6-35__x86_64.ipk
wget https://op.supes.top/packages/x86_64/shadowsocksr-libev-ssr-nat_2.5.6-35__x86_64.ipk
wget https://op.supes.top/packages/x86_64/shadowsocksr-libev-ssr-redir_2.5.6-35__x86_64.ipk
wget https://op.supes.top/packages/x86_64/shadowsocksr-libev-ssr-server_2.5.6-35__x86_64.ipk
wget https://op.supes.top/packages/x86_64/simple-obfs_0.0.5-13__x86_64.ipk
wget https://op.supes.top/packages/x86_64/ssocks_0.0.14-15__x86_64.ipk
wget https://op.supes.top/packages/x86_64/ssocksd_0.0.14-15__x86_64.ipk
wget https://op.supes.top/packages/x86_64/tcping_0.3-21__x86_64.ipk
wget https://op.supes.top/packages/x86_64/trojan-go_0.10.6-20__x86_64.ipk
wget https://op.supes.top/packages/x86_64/trojan-plus_10.0.3-9__x86_64.ipk
wget https://op.supes.top/packages/x86_64/trojan_1.16.0-8__x86_64.ipk
wget https://op.supes.top/packages/x86_64/v2ray-core_4.44.0-37__x86_64.ipk
wget https://op.supes.top/packages/x86_64/v2ray-plugin_5.0.2-56__x86_64.ipk
wget https://op.supes.top/packages/x86_64/xray-core_1.5.3-37__x86_64.ipk
wget https://op.supes.top/packages/x86_64/xray-plugin_1.5.3-32__x86_64.ipk
opkg install *.ipk

curl https://op.supes.top/packages/x86_64/luci-app-passwall_git-22.132.45013-7afe675_all.ipk -o /tmp/luci-passwall.ipk
opkg install /tmp/luci-passwall.ipk

