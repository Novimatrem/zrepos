#!/bin/bash
gsettings set org.gnome.desktop.lockdown disable-lock-screen 'false' 

sleep 0.2s

amixer set Master mute
amixer -q -D pulse sset Master mute
pactl set-sink-mute 0 1
pactl set-sink-mute 1 1
wmctrl -k on
sleep 0.2s
loginctl lock-session
xdg-screensaver lock
sleep 0.3s
dm-tool lock

amixer set Master mute
amixer -q -D pulse sset Master mute
pactl set-sink-mute 0 1
pactl set-sink-mute 1 1
wmctrl -k on
sleep 0.2s
loginctl lock-session
xdg-screensaver lock
sleep 0.3s
dm-tool lock

amixer set Master mute
amixer -q -D pulse sset Master mute
pactl set-sink-mute 0 1
pactl set-sink-mute 1 1
wmctrl -k on
sleep 0.2s
loginctl lock-session
xdg-screensaver lock
sleep 0.3s
dm-tool lock

amixer set Master mute
amixer -q -D pulse sset Master mute
pactl set-sink-mute 0 1
pactl set-sink-mute 1 1
wmctrl -k on
sleep 0.2s
loginctl lock-session
xdg-screensaver lock
sleep 0.3s
dm-tool lock

amixer set Master mute
amixer -q -D pulse sset Master mute
pactl set-sink-mute 0 1
pactl set-sink-mute 1 1
wmctrl -k on
sleep 0.2s
loginctl lock-session
xdg-screensaver lock
sleep 0.3s
dm-tool lock

dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock

sleep 0.5s
xset dpms force off
sleep 0.5s
xset dpms force off
sleep 0.5s
xset dpms force off
sleep 0.5s
xset dpms force off
sleep 0.5s
xset dpms force off

exit
