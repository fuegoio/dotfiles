#!/usr/bin/env bash

# If disable unredir_if_possible is enabled in compton's config, we may need to
# disable that to avoid flickering. YMMV. To try that, uncomment the following
# two lines and the last two lines in this script.
# dbus-send --print-reply --dest=com.github.chjj.compton.${DISPLAY/:/_} / \
#     com.github.chjj.compton.opts_set string:unredir_if_possible boolean:false

# Suspend dunst and lock, then resume dunst when unlocked.
pkill -u $USER -USR1 dunst
extern=HDMI1
if xrandr | grep "$extern disconnected"; then
	i3lock -n -i ~/Pictures/lock.png \
    		--insidecolor=37344500 --ringcolor=ffffffff --line-uses-inside \
    		--keyhlcolor=527fc1ff --bshlcolor=ff8e91ff --separatorcolor=00000000 \
   		--insidevercolor=527fc1ff --insidewrongcolor=ff8e91ff \
    		--ringvercolor=ffffffff --ringwrongcolor=ffffffff --indpos="x+86:y+1003" \
    		--radius=15 --veriftext="" --wrongtext=""
else
	i3lock -n -i ~/Pictures/lock.png \
    		--insidecolor=37344500 --ringcolor=ffffffff --line-uses-inside \
    		--keyhlcolor=527fc1ff --bshlcolor=ff8e91ff --separatorcolor=00000000 \
   		--insidevercolor=527fc1ff --insidewrongcolor=ff8e91ff \
   		--ringvercolor=ffffffff --ringwrongcolor=ffffffff --indpos="x+86:y+1353" \
    		--radius=15 --veriftext="" --wrongtext=""
fi
pkill -u $USER -USR2 dunst
