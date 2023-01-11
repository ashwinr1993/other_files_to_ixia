#!/bin/sh
# on vagrant box-1
# ----------------

# Clear IP configuration on the Host-Only adaptor between the VMs
sudo ifconfig eth0 0.0.0.0

# Load the MACsec kernel
sudo modprobe macsec

# Create the MACsec device on top of the physical one
sudo ip link add link eth0 macsec0 type macsec sci aabbccddee02ffff

# Configure the Transmit SA and keys
sudo ip macsec add macsec0 tx sa 0 pn 100 on key 01 00112233445566778899aabbccddeeff 

# Configure the Receive Channel and SA:
# MAC address of the peer
# port number, packet number and key
sudo ip macsec add macsec0 rx address aa:bb:cc:dd:ee:01 port 1
sudo ip macsec add macsec0 rx address aa:bb:cc:dd:ee:01 port 1 sa 0 pn 100 on key 02 00112233445566778899aabbccddeeff 


# Bring up the interface
sudo ip link set dev macsec0 up

# Configure an IP address on it for connectivity between the hosts
sudo ifconfig macsec0 1.1.1.1/24
sudo ip link set macsec0 type macsec encrypt on
