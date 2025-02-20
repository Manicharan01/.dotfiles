#!/usr/bin/bash

`wpctl set-volume @DEFAULT_SINK@ 5%-`

volume=$(wpctl get-volume @DEFAULT_SINK@ | sed 's/Volume: //')
volume=$(printf "%.0f" $(echo "scale=4; $volume*100" | bc))
echo $volume

notify-send -e -h int:value:"$volume%" -h string:x-canonical-private-synchronous:volume_notif -u low -i $HOME/.config/swaync/icons/volume-low.png "Volume: $volume%"

