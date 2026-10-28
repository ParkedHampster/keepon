#!/bin/bash
# This is spiritually adapted from the lightsOn script by iye
# # https://github.com/iye/lightsOn

# delay can either be set manually here or as a passed argument
[[ -z $1 ]] && delay=850 || delay=$1

screenset=:
# I don't have xscreensaver or kscreensaver - these first two may not work
[[ `pgrep -l "xscreensaver" | wc -l` -ge 1  ]] && screenset="xscreensaver-command -deactivate"
[[ `pgrep -l "kscreensaver" | wc -l` -ge 1  ]] && screenset="qdbus org.freedesktop.ScreenSaver /ScreenSave SimulateUserActivity"
[[ "$(xdg-screensaver status)" == "enabled" ]] && screenset="xdg-screensaver reset"
# if dpms enabled, define delay to toggle it before resetting screensaver
# otherwise just reset screensaver
[[ "$(xset -q)" == *"DPMS is Enabled"* ]] && function delay() { xset -dpms ; xset dpms ; $screenset ; echo "toggled" ; } || function delay() { $screenset ; }

while true
do 
    sleep $delay
    # if any sink is running, delay the screensaver and reset dpms
    [[ "$(pactl list sinks short)" == *"RUNNING"* ]] && delay
done
