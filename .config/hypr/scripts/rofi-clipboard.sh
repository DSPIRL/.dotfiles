#!/usr/bin/env bash

if pgrep -x "rofi" >/dev/null; then
    pkill -x "rofi"
else
    rofi_theme="$HOME/.config/rofi/config-clipboard.rasi"
    rofi -modi clipboard:~/.local/bin/cliphist-rofi-img -config $rofi_theme -show clipboard -show-icons
fi
