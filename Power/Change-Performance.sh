#!/bin/bash
# Am0rphous & ChatGPT 17.01.23


# Get the current governor mode
CURRENT_GOVERNOR_MODE=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

if [ "$CURRENT_GOVERNOR_MODE" == "powersave" ]; then
    echo -e "\033[32mCurrent Governor mode: $CURRENT_GOVERNOR_MODE\033[0m"
elif [ "$CURRENT_GOVERNOR_MODE" == "performance" ]; then
    echo -e "\033[31mCurrent Governor mode: $CURRENT_GOVERNOR_MODE\033[0m"
else
    echo -e "\033[33mCurrent Governor mode: $CURRENT_GOVERNOR_MODE\033[0m"
fi


# Set the CPU frequency to powersave mode

# Set the governor mode
GOVERNOR_MODE=$1

if [ -z "$GOVERNOR_MODE" ]; then
    echo "Governor mode not set, using powersave as default"
    GOVERNOR_MODE="powersave"
fi

sudo cpufreq-set -g $GOVERNOR_MODE
