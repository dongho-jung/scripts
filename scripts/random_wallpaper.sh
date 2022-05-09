#!/bin/bash

IMAGE=$(find ~/pics/wallpaper -type f | shuf -n1)

feh --bg-center $IMAGE;

WIDTH_PER_HEIGHT=$(identify -format '%w %h' $IMAGE | awk '{print $1/$2}')
