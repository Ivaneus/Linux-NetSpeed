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

curl https://opssl.cn/download/%E8%AE%A2%E9%98%85%E6%8F%92%E4%BB%B6%E6%89%80%E9%9C%80%E4%BE%9D%E8%B5%96.zip -o /tmp/pw.zip && cd /tmp && unzip pw.zip && cd /tmp/yilai
opkg install *.ipk

curl https://op.supes.top/packages/x86_64/luci-app-passwall_git-22.132.45013-7afe675_all.ipk -o /tmp/luci-passwall.ipk
opkg install /tmp/luci-passwall.ipk

