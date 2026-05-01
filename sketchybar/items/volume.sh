#!/usr/bin/env bash

sketchybar \
	--add item volume right \
	--set volume \
  display=1 \
	background.drawing=on \
	script="$PLUGIN_DIR/volume.sh" \
	--subscribe volume volume_change
