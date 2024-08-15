#!/bin/bash

sketchybar --add item calendar_events right \
           --set calendar_events icon=􀧞  \
                          update_freq=30 \
                          script="$PLUGIN_DIR/cal_events.sh"
