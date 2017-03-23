#!/bin/bash
sudo killall wpa_supplicant
sudo killall dhcpcd
sudo ip link set wlp1s0 up
sudo wpa_supplicant -i wlp1s0 -B -c /etc/wpa_supplicant/wpa.conf
sudo dhcpcd wlp1s0
