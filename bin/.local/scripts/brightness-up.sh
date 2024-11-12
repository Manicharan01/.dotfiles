#!/usr/bin/bash

iDIR="$HOME/.config/swaync/icons"
brightnessctl s 10%+

current_brightness=`brightnessctl g`
max_brightness=`brightnessctl m`
percentage_brightness=$(((current_brightness * 100) / max_brightness))

get_icon() {
	current=$1
	if   [ "$current" -le "20" ]; then
		icon="$iDIR/brightness-20.png"
	elif [ "$current" -le "40" ]; then
		icon="$iDIR/brightness-40.png"
	elif [ "$current" -le "60" ]; then
		icon="$iDIR/brightness-60.png"
	elif [ "$current" -le "80" ]; then
		icon="$iDIR/brightness-80.png"
	else
		icon="$iDIR/brightness-100.png"
	fi
}

get_icon "$percentage_brightness"

notify-send -e -h int:value:"$percentage_brightness" -h string:x-canonical-private-synchronous:brightness_notif -u low -i "$icon" "Brightness: $percentage_brightness%"
