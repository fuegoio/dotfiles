#!/usr/bin/env bash

source "$HOME/.config/sketchybar/variables.sh"

SPACE_CLICK_SCRIPT="yabai -m space --focus $SID 2>/dev/null"

# Check if space has windows
WINDOWS=$(yabai -m query --spaces --space $SID 2>/dev/null | jq -r '.["first-window"]')

SPACE_COLORS=($RED $PEACH $YELLOW $GREEN $TEAL $SKY $BLUE $LAVENDER $PINK $ROSEWATER)

if [ "$SELECTED" = "true" ]; then
	SIZE=10
	COLOR=${SPACE_COLORS[$((SID-1))]}
elif [ "$WINDOWS" -gt 0 ] 2>/dev/null; then
	SIZE=2
	COLOR=${SPACE_COLORS[$((SID-1))]}
else
	SIZE=2
	COLOR="$SURFACE0"
fi

sketchybar --animate tanh 5 --set "$NAME" \
  label.padding_right="$SIZE" \
  label.padding_left="$SIZE" \
  background.color="$COLOR" \
	click_script="$SPACE_CLICK_SCRIPT"
