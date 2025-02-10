#!/usr/bin/bash

sink=`pactl get-default-sink`
isMute=`pactl get-sink-mute $sink | sed 's/^Mute: //'`
if [ $isMute = "yes" ]; then
    `pactl set-sink-mute $sink toggle`
    notify-send -e -u low -i $HOME/.config/swaync/icons/volume-high.png "Volume: Unmuted"
elif [ $isMute = "no" ]; then
    `pactl set-sink-mute $sink toggle`
    notify-send -e -u low -i $HOME/.config/swaync/icons/volume-mute.png "Volume: Muted"
fi
