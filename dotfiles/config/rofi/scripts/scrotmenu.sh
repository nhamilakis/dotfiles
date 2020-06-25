#!/bin/bash

# TODO apply a theme @ some point
rofi_command="rofi"

### Options ###
title="Screenshot"
screen="full"
area="area"
window="window"
# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -p $title -dmenu -selected-row 1)"
case $chosen in
    $screen)
        sleep 1; scrot
        ;;
    $area)
        scrot -s
        ;;
    $window)
        sleep 1; scrot -u
        ;;
esac
