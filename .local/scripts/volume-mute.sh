#!/usr/bin/bash

pactl set-sink-mute alsa_output.pci-0000_00_1f.3.analog-stereo toggle

volume=`pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`

notify-send -e -h int:value:"$volume%" -h string:x-canonical-private-synchronous:volume_notif -u low -i $HOME/.config/swaync/icons/volume-mute.png "Volume: Muted"
