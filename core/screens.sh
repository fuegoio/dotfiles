#! /bin/sh

# Intel drivers
extern="HDMI1"
intern="eDP1"

# NVIDIA drivers
if xrandr | grep -q "HDMI-1-1"; then
    extern="HDMI-1-1"
    intern="eDP-1-1"
fi

bspc monitor $intern -n $intern

if xrandr | grep -q "$extern disconnected"; then
    mons -o
    bspc monitor $intern -o term web code chrome git design mail other1 music
    bspc monitor $intern -n $intern -d term web code chrome git design mail other1 music
    bspc monitor $extern -r
    bspc desktop -f term
else
    $HOME/.core/dual_screen.sh
    bspc monitor $extern -n $extern
    bspc desktop term -m $extern
    bspc desktop web -m $extern
    bspc desktop code -m $extern
    bspc desktop chrome -m $extern
    bspc desktop design -m $extern
    bspc desktop other1 -m $extern
    bspc desktop other2 -m $extern
    bspc desktop Desktop -r
    bspc monitor $extern -d term web code chrome design other1 other2 other3
    bspc monitor $intern -d git mail music other4
    bspc desktop -f term
fi

bspc wm -o

feh --bg-scale ~/Pictures/wallpaper.png &
$HOME/.config/polybar/start.sh

