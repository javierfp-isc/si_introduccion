#!/bin/bash

[ -d /etc/network ] || mkdir -p /etc/network
sed -i "s/IP_ADDR/$IPADD/" /etc/network/interfaces

mount -a

#Uso exec para lanzar el proceso del container
exec bash -c "/lib/systemd/systemd"

