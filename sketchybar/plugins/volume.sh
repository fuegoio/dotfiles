#!/bin/sh

source "$HOME/.config/sketchybar/variables.sh"

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  # Check if a headset is connected over Bluetooth
  HEADSET_CONNECTED=$(system_profiler SPAudioDataType 2>/dev/null | grep -i "bluetooth\|headset\|headphone" && echo "yes")

  if [ -n "$HEADSET_CONNECTED" ]; then
    case "$VOLUME" in
      [6-9][0-9]|100) ICON="󰋋" COLOR=$PINK
      ;;
      [3-5][0-9]) ICON="󰋋" COLOR=$PINK
      ;;
      [1-9]|[1-2][0-9]) ICON="󰋋" COLOR=$PINK
      ;;
      *) ICON="󰋋" COLOR=$SURFACE2
    esac
  else
    case "$VOLUME" in
      [6-9][0-9]|100) ICON="󰕾" COLOR=$PINK
      ;;
      [3-5][0-9]) ICON="󰖀" COLOR=$PINK
      ;;
      [1-9]|[1-2][0-9]) ICON="󰕿" COLOR=$PINK
      ;;
      *) ICON="󰖁" COLOR=$SURFACE2
    esac
  fi

  sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%" icon.color="$COLOR"
fi
