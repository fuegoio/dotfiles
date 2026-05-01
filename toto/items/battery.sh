#!/usr/bin/env bash

sketchybar --add item battery right \
	--set battery \
	update_freq=60 \
  display=1 \
	icon.color="$BLUE" \
  background.padding_right=12 \
	script="$PLUGIN_DIR/battery.sh" \
	--subscribe battery power_source_change system_woke
