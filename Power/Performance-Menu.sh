#!/bin/bash
# Am0rphous & ChatGPT 18.01.23

# Available governor modes
GOVERNOR_MODES=("powersave" "performance" "ondemand" "conservative" "userspace" "schedutil")

# Display menu
echo "Select a governor mode:"
for i in "${!GOVERNOR_MODES[@]}"; do
  echo $((i+1))". ${GOVERNOR_MODES[i]}"
done

# Get user selection
read -p "Enter number: " SELECTION

# Set the governor mode
SELECTED_GOVERNOR_MODE=${GOVERNOR_MODES[$((SELECTION-1))]}
sudo cpufreq-set -g $SELECTED_GOVERNOR_MODE
echo "Governor mode set to: $SELECTED_GOVERNOR_MODE"
