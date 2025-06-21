#!/usr/bin/env bash

if pgrep -x "rofi" >/dev/null; then
    pkill -x "rofi"
else
    echo "" | rofi -dmenu | xargs -I{} xdg-open https://kagi.com/search?q={}
fi
