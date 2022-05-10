#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "[!] usage: $0 WINDOW_CLASS KEYS"
    exit
fi

prev_window=`xdotool getactivewindow`
current_desktop=`xdotool get_desktop`

xdotool search --onlyvisible --class --desktop $current_desktop $1 windowactivate --sync key $2 windowactivate $prev_window