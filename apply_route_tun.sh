#!/bin/bash

sudo ip addr add 192.168.0.1/24 dev tun0
sudo ip link set up dev tun0
sudo ip route add 10.0.0.0/8 via 10.174.19.254 dev ens3
sudo ip route add default via 192.168.0.1 dev tun0

