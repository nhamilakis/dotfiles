#!/bin/bash

rofi_command="rofi -theme themes/powermenu.rasi"

### Options ###
power_off=""
reboot=""
lock=""
suspend="鈴"
log_out=""


# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"


chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power_off)
        echo "shutting down" >> $HOME/powermenu.log
        ;;
    $reboot)
        echo "reboot" >> $HOME/powermenu.log
        ;;
    $lock)
        echo "screen lock" >> $HOME/powermenu.log
        ;;
    $suspend)
        echo "suspend" >> $HOME/powermenu.log
        ;;
    $log_out)
        echo "log out" >> $HOME/powermenu.log
        ;;
esac
