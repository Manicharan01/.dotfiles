#!/usr/bin/bash
sink="@DEFAULT_SINK@"
isMute=$(wpctl get-volume $sink | grep -o "MUTED")

if [ "$isMute" = "MUTED" ]; then
    wpctl set-mute $sink 0
    notify-send -e -u low -i $HOME/.config/swaync/icons/volume-high.png "Volume: Unmuted"
else
    wpctl set-mute $sink 1
    notify-send -e -u low -i $HOME/.config/swaync/icons/volume-mute.png "Volume: Muted"
fi
