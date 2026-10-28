#!/bin/bash
# This is spiritually adapted from the lightsOn script by iye
# # https://github.com/iye/lightsOn

# delay can either be set manually here or as a passed argument
[[ -z $1 ]] && delay=850 || delay=$1

# I don't have xscreensaver or kscreensaver - these first two may not work
[[ -z $screenset && `pgrep -l "xscreensaver" | wc -l` -ge 1  ]] && screenset="xscreensaver-command -deactivate"
[[ -z $screenset && `pgrep -l "kscreensaver" | wc -l` -ge 1  ]] && screenset="qdbus org.freedesktop.ScreenSaver /ScreenSave SimulateUserActivity"
[[ -z $screenset && "$(xset -q)" == *"DPMS is Enabled"* ]] && function resetdpms() { xset -dpms ; xset dpms ; echo "toggled" ; } && screenset=resetdpms

while true
do 
    [[ "$(pactl list sinks short)" == *"RUNNING"* ]] && $screenset > /dev/null
    sleep $delay
done
