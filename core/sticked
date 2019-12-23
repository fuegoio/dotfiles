#!/bin/bash

echo 'Focus window ...'
sleep 2s

bspwm_id=`bspc query -N -n .focused`
win_id=`xdotool getactivewindow`

bspc node $bspwm_id -t floating
bspc node $bspwm_id -g sticky

xdotool windowsize $win_id 540 300
xdotool windowmove $win_id 1363 30
