#!/bin/bash

# trigger udev, so /dev gets refreshed copy at startup
udevd &
udevadm trigger

# run the python example
python /usr/src/app/rgb-lcd.py
