#!/bin/bash
REALPATH="$PWD"
sleep 0.1
cd /tmp
xclip -i /dev/null
touch blank
xclip -selection clipboard blank
sleep 0.1 && rm -rf blank
xsel -bc
cd $REALPATH
qdbus org.kde.klipper /klipper org.kde.klipper.klipper.clearClipboardHistory
sleep 0.1
clear
echo "Clipboards cleared."
exit
