#!/bin/sh

# Bootstrap File for ycast docker container
# Variables
# YC_VERSION version of ycast software
# YC_STATIONS path an name of the indiviudual stations.yml e.g. /ycast/stations/stations.yml
# YC_DEBUG turn ON or OFF debug output of ycast server else only start /bin/sh
# YC_PORT port ycast server listens to, e.g. 80
# YC_ADDRS known addresses of *.vtuner.com. For Denon: YC-ADDRS="8.38.76.252 154.27.73.59 23.238.108.243)
# Docker image must have elevated privileges: NET_ADMIN


for rg in $YC_ADDRS; do
    ip addr add $rg dev eth0
done

if [ "$YC_DEBUG" = "OFF" ]; then
	/usr/bin/python3 -m ycast -c $YC_STATIONS -p $YC_PORT

elif [ "$YC_DEBUG" = "ON" ]; then
	/usr/bin/python3 -m ycast -c $YC_STATIONS -p $YC_PORT -d

else
	/bin/sh

fi
