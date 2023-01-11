#!/bin/sh

cmd="$1"
intf="eth0"
phyad="$2"
addr="$3"
data="$4"
mmd="0x001F"

if [ $cmd = "read" ]
then
	./phytool/phytool write $intf/$phyad/0x000D $mmd
	./phytool/phytool write $intf/$phyad/0x000E $addr
	./phytool/phytool write $intf/$phyad/0x000D 0x401F
	./phytool/phytool read $intf/$phyad/0x000E
elif [ $cmd = "write" ]
then
	./phytool/phytool write $intf/$phyad/0x000D $mmd
	./phytool/phytool write $intf/$phyad/0x000E $addr
	./phytool/phytool write $intf/$phyad/0x000D 0x401F
	./phytool/phytool write $intf/$phyad/0x000E $data
fi
