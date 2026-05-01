#!/usr/bin/env bash

PLAYING=1
if [ "$(echo "$INFO" | jq -r '.["Player State"]')" = "Playing" ]; then
  PLAYING=0
  TRACK="$(echo "$INFO" | jq -r .Name | cut -c1-20)"
  ARTIST="$(echo "$INFO" | jq -r .Artist | cut -c1-20)"
fi

args=()
if [ $PLAYING -eq 0 ]; then
  args+=(--animate tanh 5 --set music label="$TRACK - $ARTIST" drawing=on)
else
  args+=(--animate tanh 5 \
         --set music drawing=off \
         --set music popup.drawing=off)
fi
sketchybar -m "${args[@]}"
