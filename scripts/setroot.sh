#! /bin/bash
ETH_IF=eth0

IFS_DIR="/sys/class/net/$ETH_IF"

CARRIER=$(grep "" $IFS_DIR/carrier)
OSTATE=$(grep "" $IFS_DIR/operstate)

if [ $CARRIER -eq 1 ] && [ $OSTATE == "up" ]; then
	CONN_ICON="󰈀"
else
	CONN_ICON="󰤨"
fi

while true; do
	xsetroot -name "$(echo -e "\x06\x03$(date +'%d %b %Y %k:%M')   $CONN_ICON")"
	sleep 2
done


