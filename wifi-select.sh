#!/bin/bash

# Get available networks
mapfile -t networks < <(nmcli -t -f SSID dev wifi | grep -v '^$' | sort -u)

# Check if any networks were found
if [ ${#networks[@]} -eq 0 ]; then
    echo "No Wi-Fi networks found."
    exit 1
fi

# Display networks with numbers
echo "Available Wi-Fi Networks:"
for i in "${!networks[@]}"; do
    echo "$i - ${networks[$i]}"
done

# Ask for selection
read -p "Enter the number of the Wi-Fi network you want to connect to: " choice

# Validate input
if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -ge "${#networks[@]}" ]; then
    echo "Invalid selection."
    exit 1
fi

# Get selected SSID
SSID="${networks[$choice]}"

# Connect using nmcli
echo "Connecting to $SSID..."
nmcli dev wifi connect "$SSID"

# Check connection status
if [ $? -eq 0 ]; then
    echo "Successfully connected to $SSID"
else
    echo "Failed to connect to $SSID"
fi

