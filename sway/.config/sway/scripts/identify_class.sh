#!/bin/bash

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <string to search for in swaymsg -t get_tree>"
    exit 1
fi

# Use swaymsg to search for the given string
swaymsg -t get_tree | grep -i "$1"
