#!/usr/bin/env nu

mut selected = fd . /home /home/charan/ ~/plugins ~/Projects ~/.config ~/.dotfiles --min-depth 1 --max-depth 1 --type d | fzf

if ($selected | is-empty) {
    exit 0
}

mut basename_selected = $selected | path basename
let tmux_running = pgrep tmux

if (($env.TMUX | is-empty);($tmux_running | is-empty )) {
    "HellO"
    tmux new-session -s $basename_selected -c $selected
    exit 0
}

let session_exits = (tmux ls | lines | str contains $basename_selected | any {|x| $x})
if ($session_exits == false) {
    "Hello"
    tmux new-session -ds $basename_selected -c $selected
}

if ($env.TMUX | is-empty) {
    "HellO"
    tmux attach -t $basename_selected
} else {
    "HellO"
    tmux switch-client -t $basename_selected
}
