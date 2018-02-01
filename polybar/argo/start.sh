#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if xrandr | grep "HDMI1 connected"; then
    MONITOR=HDMI1 polybar top &
    MONITOR=HDMI1 polybar bottom &
    polybar external_top &
else
    MONITOR=eDP1 polybar top &
    MONITOR=eDP1 polybar bottom &
fi

echo "Bars launched..."
