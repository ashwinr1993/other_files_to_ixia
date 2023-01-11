#!/bin/sh

> /var/log/cups/error_log

echo "Link status of PHY's 0 & 3"
./phytool/extended_read_write.sh read 0x0 0x0001
./phytool/extended_read_write.sh read 0x3 0x0001
echo "------------------------"

echo "Reg 0x0F00 read of DUT's 4 & 5"
./phytool/extended_read_write.sh read 0x4 0x0F00
./phytool/extended_read_write.sh read 0x5 0x0F00
echo "------------------------"

./phytool/extended_read_write.sh write 0x0 0x0032 0x00D3
./phytool/extended_read_write.sh write 0x3 0x0032 0x00D0

echo "RGMIICTL mode of PHY's 0 & 3"
./phytool/extended_read_write.sh read 0x0 0x0032
./phytool/extended_read_write.sh read 0x3 0x0032
echo "------------------------"

echo "Reverse and pass through loopback mode of PHY's 3"
./phytool/extended_read_write.sh write 0x3 0x0016 0x00a0
./phytool/extended_read_write.sh read 0x3 0x0016
echo "------------------------"

echo "Viterbi decoder of PHY's 0 & 3 disabled"
./phytool/extended_read_write.sh write 0x0 0x0053 0x2053
./phytool/extended_read_write.sh read 0x0 0x0053
./phytool/extended_read_write.sh write 0x3 0x0053 0x2053
./phytool/extended_read_write.sh read 0x3 0x0053
echo "------------------------"
