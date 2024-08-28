#!/bin/bash
setxkbmap dvorak
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us+dvorak')]"
echo "Switched to Dvorak."
