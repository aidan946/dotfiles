#!/bin/sh
# Toggle all monitors on/off using wlr-randr.
# State is tracked via a flag file in /tmp.

FLAG="/tmp/mango-monitors-off"

if [ -f "$FLAG" ]; then
    wlr-randr --output DP-3 --on
    wlr-randr --output DP-2 --on
    rm -f "$FLAG"
else
    wlr-randr --output DP-3 --off
    wlr-randr --output DP-2 --off
    touch "$FLAG"
fi
