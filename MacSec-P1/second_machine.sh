sudo modprobe macsec

sudo ip link add link eth0 macsec0 type macsec sci aabbccddee01ffff
sudo ip macsec add macsec0 tx sa 0 pn 100 on key 02 00112233445566778899aabbccddeeff

sudo ip macsec add macsec0 rx address aa:bb:cc:dd:ee:01 port 1
sudo ip macsec add macsec0 rx address aa:bb:cc:dd:ee:01 port 1 sa 0 pn 100 on key 01 00112233445566778899aabbccddeeff

sudo ip link set dev macsec0 up

sudo ifconfig macsec0 1.1.1.2/24
sudo ip link set macsec0 type macsec encrypt on
