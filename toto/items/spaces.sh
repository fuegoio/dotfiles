#!/usr/bin/env bash

sketchybar --add item space.separator-left left \
  --set space.separator-left \
  label.drawing=off \
  icon.drawing=off \
  background.drawing=off \
  width=8

# Color palette for spaces
for i in {0..9}; do
	sid=$((i + 1))
	sketchybar --add space space.$sid left \
		--set space.$sid associated_space=$sid \
		icon.drawing=off \
    background.height=14 \
    background.corner_radius=3 \
    background.padding_right=8 \
    background.padding_left=8 \
		script="$PLUGIN_DIR/space.sh"
done

sketchybar --add item space.separator-right left \
  --set space.separator-right \
  label.drawing=off \
  icon.drawing=off \
  background.drawing=off \
  width=0

sketchybar --add bracket spaces '/space.*/' \
