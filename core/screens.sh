#! /bin/sh

extern=HDMI1
intern=eDP1

if xrandr | grep "$extern disconnected"; then
    mons -o
    bspc monitor $intern -n $intern -d term web code chrome design other1 other2 music
    bspc monitor $extern -r
    bspc desktop -f term
else
    mons -s
    bspc desktop Desktop -r
    bspc monitor $extern -n $extern -d term web code chrome design other1 other2 music
    bspc monitor $intern -r
    bspc desktop -f term
fi

feh --bg-scale ~/Pictures/wallpaper.jpg &
$HOME/.config/polybar/start.sh
