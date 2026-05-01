#!/usr/bin/env bash

COLOR="$TEXT"

sketchybar \
	--add item front_app left \
	--set front_app script="$PLUGIN_DIR/front_app.sh" \
	icon.drawing=off \
	background.padding_left=24 \
	label.font="$FONT:Medium:12.0" \
	label.color="$SURFACE2" \
	label.padding_left=12 \
	associated_display=active \
	--subscribe front_app front_app_switched
