#!/usr/bin/bash

sink=`pactl get-default-sink`
`pactl set-sink-volume $sink +5%`

volume=`pactl get-sink-volume $sink | sed -n 's/.*\/\s*\([0-9]\+\)%.*/\1/p'`

notify-send -e -h int:value:"$volume%" -h string:x-canonical-private-synchronous:volume_notif -u low -i $HOME/.config/swaync/icons/volume-high.png "Volume: $volume%"
