#!/usr/bin/bash

pactl set-sink-volume 0 -5%

volume=`pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`

notify-send -e -h int:value:"$volume%" -h string:x-canonical-private-synchronous:volume_notif -u low -i $HOME/.config/swaync/icons/volume-low.png "Volume: $volume%"
