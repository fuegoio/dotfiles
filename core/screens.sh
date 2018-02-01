#! /bin/sh

extern=HDMI1
intern=eDP1

bspc config remove_disabled_monitors true 
bspc config remove_unplugged_monitors true

if xrandr | grep "$extern disconnected"; then
    mons -o
    bspc monitor $intern -n $intern -d other2 mail music term web code chrome other1
    bspc monitor $intern -o term web code chrome other1 other2 mail music
    bspc monitor $extern -r
else
    mons -e right
    xset s off
    xset s off -dpms
    bspc monitor $extern -n $extern
    bspc monitor $intern -n $intern -d term web code chrome other1 other2 mail music
    bspc desktop term -m $extern
    bspc desktop web -m $extern
    bspc desktop code -m $extern
    bspc desktop chrome -m $extern
    bspc desktop other1 -m $extern
    bspc desktop Desktop -r
    bspc monitor $extern -d term web code chrome other1 other3 other4
    bspc monitor $intern -n $intern -d other2 mail music
fi

feh --bg-scale ~/Pictures/wallpaper.jpg &
$HOME/.config/polybar/start.sh
