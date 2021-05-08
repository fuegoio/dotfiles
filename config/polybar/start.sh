#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Intel drivers
extern="HDMI-1"
intern="eDP-1"

# NVIDIA drivers
if cat $HOME/.core/.cache/xrandr | grep -q "HDMI-1-1"; then
    extern="HDMI-1-1"
    intern="eDP-1-1"
fi

bspc config -m $intern top_padding 5

if cat $HOME/.core/.cache/xrandr | grep "$extern connected"; then
    MONITOR=$extern polybar primary-dual-big &
    MONITOR=$intern polybar primary-dual-small &
    MONITOR=$extern polybar secondary-dual &
else
    MONITOR=$intern polybar primary &
    MONITOR=$intern polybar secondary &
fi

sleep 2;
bspc config right_padding 5

echo "Bars launched..."

