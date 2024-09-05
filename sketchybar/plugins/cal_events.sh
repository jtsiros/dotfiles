#!/bin/bash

next_event=$(/usr/local/bin/calendar-events)
sketchybar --set $NAME label="${next_event}"
