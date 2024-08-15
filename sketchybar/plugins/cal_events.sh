#!/bin/bash
# Check if there are any upcoming events
events=$(icalBuddy -nc -eep '' -b '' -ea -n -nrd "1 minute" -li 1 eventsToday)

# If no events are found, display "No meetings"
if [ -z "$events" ]; then
    sketchybar --set $NAME label="No meetings"
    exit 0
fi

# Extract the event title (first line)
title=$(echo "$events" | head -n 1)

# Extract the start time (from the last line)
start_time=$(icalBuddy -nc -eep '' -b '' -ea -n -nrd "1 minute" -li 1 eventsToday | tail -n 1 | awk '{print $1}' | tr -d '[:cntrl:]' | tr -d '[[:space:]]')

# Convert start time to 24-hour format for easier processing
start_time_24h=$(date -jf "%I:%M %p" "$start_time" +"%H:%M")

# Get the current time
current_time=$(date +"%H:%M")

# Convert times to minutes since midnight
start_minutes=$(( $(date -jf "%H:%M" "$start_time_24h" +%s) / 60 ))
current_minutes=$(( $(date -jf "%H:%M" "$current_time" +%s) / 60 ))

# Calculate the difference in minutes
minutes_until_start=$((start_minutes - current_minutes))

sketchybar --set $NAME label="$title in ${minutes_until_start}m"
