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
rm -rf /tmp/yilai.zip
rm -rf /tmp/yilai
cd /tmp
wget http://101.32.205.183/yilai.zip
unzip yilai.zip
cd yilai
opkg install *.ipk


