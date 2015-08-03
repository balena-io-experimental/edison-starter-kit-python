#!/bin/bash

# Mount needed for GPIO pins to be enabled correctly
if mount -l -t debugfs | grep "on /sys/kernel/debug"; then
    echo "debugfs already mounted"
else
    mount -t debugfs nodev /sys/kernel/debug
fi

# trigger udev, so /dev gets refreshed copy at startup
udevd &
udevadm trigger

# run the python example
python /usr/src/app/rgb-lcd.py
