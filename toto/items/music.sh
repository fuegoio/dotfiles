#!/usr/bin/env bash

SPOTIFY_EVENT="com.spotify.client.PlaybackStateChanged"

sketchybar \
  --add event spotify_change $SPOTIFY_EVENT \
  --add item music right \
	--set music \
  display=1 \
	icon=󰎆 \
	icon.color="$GREEN" \
	label.max_chars=23 \
  scroll_texts=true \
	updates=on \
	script="$PLUGIN_DIR/music.sh" \
  --subscribe music spotify_change
