#!/bin/sh

# Format: Tue 09, July | 17:28
DATE=$(date '+%a %d, %B')
TIME=$(date '+%H:%M')

# Set date label for datetime.date item
sketchybar --set "datetime.date" label="$DATE"

# Set time label for datetime.time item
sketchybar --set "datetime.time" label="$TIME"
