#!/usr/bin/env sh

xrandr="$(cat $HOME/.core/.cache/xrandr)"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Intel drivers
intern="eDP-1"

# NVIDIA drivers
if echo $xrandr | grep -q "eDP-1-1"; then
    intern="eDP-1-1"
fi

bspc config -m $intern top_padding 5

external_regex="[^e]DP-(\S*) connected"
if [[ $xrandr =~ $external_regex ]]
then
    extern="DP-${BASH_REMATCH[1]}"

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

