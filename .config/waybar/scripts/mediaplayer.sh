#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -n 1)

if [[ -n "$player" && "$(playerctl -p "$player" status 2>/dev/null)" == "Playing" ]]; then
    title=$(playerctl -p "$player" metadata xesam:title 2>/dev/null)
    [[ ${#title} -gt 60 ]] && title="${title:0:60}..."
    echo "$title"
else
    echo ""
fi
