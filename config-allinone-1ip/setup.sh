#!/bin/sh

if ! grep "ogstun" /proc/net/dev > /dev/null; then
    ip tuntap add name ogstun mode tun
fi
# Create new ogstun interface (and clean last execution)
ip addr del 45.45.0.1/16 dev ogstun 2> /dev/null
ip addr add 45.45.0.1/16 dev ogstun

# careful here customize according to your config here assuming 192.168.50.x is my net with dns/int access
ip r del default via 172.30.2.1
ip r add default via 192.168.50.1

# Set up network connectivity via ogstun (external interface for vEPC)
ip link set ogstun up
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -I INPUT -i ogstun -j ACCEPT
