#!/bin/bash

# Options for powermenu
lock="    Lock"
logout="    Logout"
shutdown="    Shutdown"
reboot="    Reboot"
sleep="   Sleep"

# Get answer from user via rofi
selected_option=$(echo "$lock
$logout
$sleep
$reboot
$shutdown" | rofi -dmenu\
                  -p "PowerMenu"\
                  -config "~/.config/rofi/config.rasi"\
                  -font "FiraCode Nerd Font Mono 12"\
                  -width "15"\
                  -lines 5\
                  -line-margin 3\
                  -line-padding 10\
		  -scrollbar-width "0") 

# Do something based on selected option
if [ "$selected_option" == "$lock" ]
then
    ~/.config/i3lock-fancy-rapidest.sh
elif [ "$selected_option" == "$logout" ]
then
    bspc quit
elif [ "$selected_option" == "$shutdown" ]
then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]
then
    systemctl reboot
elif [ "$selected_option" == "$sleep" ]
then
    amixer set Master mute
    ~/.config/i3lock-fancy-rapidest.sh
    systemctl suspend
else
    echo "No match"
fi
