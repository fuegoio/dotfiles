#!/usr/bin/env bash

# Time item with MANTLE background
sketchybar --add item datetime.time right \
	--set datetime.time update_freq=1 \
  icon.drawing=off \
	label.color="$ROSEWATER" \
	label.padding_left=12 \
	label.padding_right=12 \
	background.color="$MANTLE" \
	background.padding_left=-10 \
	background.padding_right=0 \
	script="$PLUGIN_DIR/datetime.sh"

# Date item with BASE background
sketchybar --add item datetime.date right \
	--set datetime.date update_freq=1 \
  icon.drawing=off \
	label.color="$TEXT" \
	label.padding_left=12 \
	label.padding_right=14 \
	background.drawing=off \
	script="$PLUGIN_DIR/datetime.sh"

sketchybar \
  --add bracket datetime datetime.date datetime.date \
	--set datetime \
	background.color="$BASE"

