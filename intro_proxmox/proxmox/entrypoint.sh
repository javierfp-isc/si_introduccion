#!/bin/bash

mount -a

#Uso exec para lanzar el proceso del container
exec bash -c "/lib/systemd/systemd"

