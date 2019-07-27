#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

bspc config -m eDP1 top_padding 5

if xrandr | grep "HDMI1 connected"; then
    MONITOR=HDMI1 polybar top &
    MONITOR=eDP1 polybar external_top &
    sleep 2
    bspc config -m HDMI1 right_padding 5
    bspc config -m HDMI1 bottom_padding 5
else
    MONITOR=eDP1 polybar top &
fi

echo "Bars launched..."
sleep 2
bspc config -m eDP1 right_padding 5
bspc config -m eDP1 bottom_padding 5

