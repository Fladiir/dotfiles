#!/bin/bash
ETH_IF=wlan0

IFS_DIR="/sys/class/net/$ETH_IF"

CARRIER=$(grep "" $IFS_DIR/carrier)
OSTATE=$(grep "" $IFS_DIR/operstate)


trap "echo click" SIGRTMIN+10

while true; do
	if [ $CARRIER -eq 1 ] && [ $OSTATE == "up" ]; then
		CONN_ICON="󰤨"
	else
		CONN_ICON="󰈀"
	fi
	xsetroot -name "$(echo -e "\x0a\x02$(date +'%d %b %Y %k:%M')   $CONN_ICON")"
	sleep 2
done

