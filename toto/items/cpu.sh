#!/usr/bin/env bash

sketchybar --add item cpu right \
	--set cpu \
	update_freq=3 \
  display=1 \
	icon.color="$PEACH" \
	script="$PLUGIN_DIR/cpu.sh"
