#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Intel drivers
extern="HDMI1"
intern="eDP1"

# NVIDIA drivers
if xrandr | grep -q "HDMI-1-1"; then
    extern="HDMI-1-1"
    intern="eDP-1-1"
fi

bspc config -m $intern top_padding 5

if xrandr | grep "$extern connected"; then
    MONITOR=$extern polybar top &
    MONITOR=$intern polybar external_top &
    sleep 2
    bspc config -m $extern right_padding 5
    bspc config -m $extern bottom_padding 5
else
    MONITOR=$intern polybar top &
fi

echo "Bars launched..."
sleep 2
bspc config -m $intern right_padding 5
bspc config -m $intern bottom_padding 5

