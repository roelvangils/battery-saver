#!/bin/bash

# Array of Wi-Fi networks that indicate being near a power source
office_networks=("Eleven Ways" "Home Office")

# Get battery cycles
cycles_count=$(system_profiler SPPowerDataType | grep "Cycle Count" | awk '{print $3}')

# Function to check if running on battery power
is_on_battery() {
    pmset -g batt | grep -q "Now drawing from 'Battery Power'"
}

# Function to check if connected to any of the specified Wi-Fi networks
is_on_office_wifi() {
    current_wifi=$(networksetup -getairportnetwork en0 | awk -F": " '{print $2}')
    for network in "${office_networks[@]}"; do
        if [ "$current_wifi" = "$network" ]; then
            return 0 # True, connected to an office network
        fi
    done
    return 1 # False, not connected to any office network
}

# Function to speak a message
speak_message() {
    say "Hey there! It appears that you are near a power outlet. Remember to connect your laptop to preserve the lifespan of your built-in battery. You have used $cycles_count battery cycles so far." -v Samantha
}

# Main logic
if is_on_battery && is_on_office_wifi; then
    speak_message
fi
