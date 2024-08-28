#!/bin/bash
setxkbmap -layout us -variant ,qwerty
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+qwerty')]"
echo "Switched to QWERTY."
