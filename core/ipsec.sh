#!/usr/bin/env bash

mkdir -p /var/run/xl2tpd
touch /var/run/xl2tpd/l2tp-control
systemctl restart strongswan
sleep 5
ipsec up myvpn
systemctl restart xl2tpd
sleep 2 
echo "c myvpn" > /var/run/xl2tpd/l2tp-control
sleep 5

ip route add 51.15.208.54 via 10.51.78.1 dev wlp2s0
ip route add default dev ppp0
