#!/bin/sh

./phytool/phytool write eth0/0x8/0x0010 0x0040
./phytool/phytool read eth0/0x8/0x0010

./phytool/phytool write eth0/0x9/0x0010 0x0040
./phytool/phytool read eth0/0x9/0x0010

export http_proxy=http://webproxy.ext.ti.com:80
export https_proxy=http://webproxy.ext.ti.com:80

ifconfig eth0 down
ifconfig eth0 hw ether aa:bb:cc:dd:ee:02
ifconfig eth0 up

source ~/.bash_aliases
ifconfig
