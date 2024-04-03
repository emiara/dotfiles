#!/bin/bash
# launch_firefox_to_scratchpad.sh

# Launch Firefox
firefox-developer-edition &
# Wait for a moment to ensure the window is loaded
sleep 2
# Move the most recently opened Firefox window to the scratchpad
swaymsg '[class="Firefox" instance="Navigator"] scratchpad show, move scratchpad'

