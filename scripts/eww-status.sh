#!/bin/bash

if [[ ! `pidof eww` ]]; then
	~/dev/eww/target/release/eww -c ~/.config/eww/ daemon 2> ./errors.txt
	sleep 1
fi

~/dev/eww/target/release/eww -c ~/.config/eww/ open-many statusbar-0 statusbar-1
