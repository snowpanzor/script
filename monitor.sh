#!/bin/sh
#Written by David


if grep -q closed /proc/acpi/button/lid/LID/state;
then
    xrandr --output eDP1 --off
    if ! grep -q disconnected /sys/class/drm/card0-DP-1/status;
    then
        xrandr --output DP1 --auto --primary --rotate left
    fi
else
    if ! grep -q disconnected /sys/class/drm/card0-DP-1/status;
    then
        xrandr --output DP1 --auto --primary --rotate left --left-of eDP1 --output eDP1 --auto
    else
        xrandr --output eDP1 --auto
    fi
fi
