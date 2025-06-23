#!/usr/bin/env bash

if pgrep -x "rofi" >/dev/null; then
    pkill -x "rofi"
else
    rofi -modi clipboard:cliphist-rofi-img -show clipboard -show-icons
fi
