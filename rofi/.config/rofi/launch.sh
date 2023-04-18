#!/bin/bash

# Terminate already running bar instances
killall -q rofi

# Wait until the processes have been shut down
while pgrep -u $UID -x rofi >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
rofi -show run

echo "Polybar launched..."
