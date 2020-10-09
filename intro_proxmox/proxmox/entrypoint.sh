#!/bin/bash

[ -d /etc/network ] || mkdir -p /etc/network
echo "auto eth0" >> /etc/network/interfaces
echo "iface eth0 inet static" >> /etc/network/interfaces
echo "address $IPADD" >> /etc/network/interfaces
echo "netmask 255.255.255.0" >> /etc/network/interfaces
echo "gateway 192.168.199.1" >> /etc/network/interfaces

ifdown eth0 && ifup eth0

#Uso exec para lanzar el proceso del container
exec bash -c "/lib/systemd/systemd"

