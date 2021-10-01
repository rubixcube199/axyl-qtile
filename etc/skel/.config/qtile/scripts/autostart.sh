#!/bin/env bash

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# set background
bash $HOME/.config/qtile/scripts/.fehbg

# Kill if already running
killall -9 picom sxhkd dunst xfce4-power-manager

# Launch notification daemon
dunst \
-geom "280x50-10+38" -frame_width "1" -font "Source Code Pro Medium 10" \
-lb "#0F131FFF" -lf "#82dbf4FF" -lfr "#548FABFF" \
-nb "#0F131FFF" -nf "#82dbf4FF" -nfr "#548FABFF" \
-cb "#2E3440FF" -cf "#BF616AFF" -cfr "#BF616AFF" &

# power manager and picom start
xfce4-power-manager &
picom --config $HOME/.config/qtile/picom.conf &

if [[ ! `pidof xfce-polkit` ]]; then
    /usr/lib/xfce-polkit/xfce-polkit &
fi

# Start udiskie
udiskie &
