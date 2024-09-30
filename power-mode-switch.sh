#!/bin/bash

# Function to set brightness
set_brightness() {
    # Get maximum brightness
    max_brightness=$(cat /sys/class/backlight/*/max_brightness)
    
    # Calculate new brightness
    new_brightness=$(echo "$max_brightness * $1" | bc -l | xargs printf "%.0f")
    
    # Set new brightness
    echo $new_brightness | sudo tee /sys/class/backlight/*/brightness
}

if [ "$1" = "on" ]; then
    system76-power profile performance
    set_brightness 1.0  # Set to 100% brightness
elif [ "$1" = "off" ]; then
    system76-power profile battery
    set_brightness 0.6  # Set to 60% brightness
fi