#!/usr/bin/env sh

# Intel drivers
extern="HDMI-1"
intern="eDP-1"

# NVIDIA drivers
if cat $HOME/.core/.cache/xrandr | grep -q "HDMI-1-1"; then
    extern="HDMI-1-1"
    intern="eDP-1-1"
fi

if pgrep "spotify" >/dev/null; then
    if ! pgrep -f "polybar music" >/dev/null; then
        if cat $HOME/.core/.cache/xrandr | grep "$extern connected"; then
            MONITOR=$extern polybar music-dual &
        else
            MONITOR=$intern polybar music &
        fi
    fi
else
    if pgrep -f "polybar music" >/dev/null; then
        pkill -f "polybar music" &>/dev/null
    fi
fi
