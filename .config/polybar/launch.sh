#!/bin/bash

######################
# Kill programs used by modules 
#
# hideit
ps -ef | grep hideIt | grep -v grep | awk '{print $2}' | xargs kill
#
# cava
killall -q cava


######################
# Kill polybar instances
#
killall -q polybar
#
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

######################
# Create config
bash ~/.config/polybar/config-merge/config-merge.sh  ~/.config/polybar/config

######################
# Launch polybar(s)
#
polybar floating -r -l warning &
polybar floating_wm -r -l warning &
polybar floating_popup -r -l warning &
#
#polybar pc_vnc_landscape -r -l warning &
#
# Wait a moment for the bar(s) to set up
sleep 1


######################
# Launch programs used by modules
#
setsid ~/.config/polybar/scripts/hideIt.sh --wait --region 0x800+1280+-10 --name '^polybar-floating_LVDS1$' > /dev/null 2>&1 &
#
# Hide floating_sysinfo polybar and reset popup state
(xdo id -m -N Polybar && polybar-msg -p $(ps -ef | grep floating_sysinfo | grep -v grep | awk '{print $2}') cmd hide)  > /dev/null 2>&1 &
STATUSFILE="$HOME/.config/polybar/scripts/.sysinfo.active"
rm -f "$STATUSFILE"


######################
# Done!
#
echo "Bar launched!"
