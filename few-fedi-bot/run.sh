#!/bin/bash

cd "$(dirname "$0")"

echo "waiting for server to boot"
sleep 15s

# you need to specifically have firefox open, and switched to
# the mastodon homepage/dashboard/main thing, in a position ready to toot.
# it should be the only tab, and you should be switched to it

# sudo apt install -y xclip
# install xclip in your distro

# sudo apt install -y wmctrl
# install wmctrl in your distro

# sudo apt install -y xdotool
# install xdotool in your distro

rm -rf sentence.txt

clear
clear

function randword {
WORDFILE=/usr/share/dict/words
# seed random from pid
RANDOM=$$;
# using cat means wc outputs only a number, not number followed by filename
lines=$(cat $WORDFILE  | wc -l);
rnum=$((RANDOM*RANDOM%$lines+1));
sed -n "$rnum p" $WORDFILE;
}

printf %s "$(randword) " | tr [:upper:] [:lower:] | fold -w 80 >> sentence.txt
printf %s "futa" | tr [:upper:] [:lower:] | fold -w 80 >> sentence.txt
fold -w 80 -s sentence.txt
echo $(cat sentence.txt) | xclip
echo $(cat sentence.txt) | xclip -sel clip
echo ""
echo ""
sleep 2s
sleep 1s
wmctrl -a "Mozilla Firefox"
sleep 1s
xdotool getactivewindow key shift+Tab
sleep 1s
xdotool key 1
sleep 1s
xdotool getactivewindow keyup shift
xdotool getactivewindow keyup ctrl
sleep 1s
xdotool keyup n
xdotool keyup shift
xdotool keyup Tab
xdotool keyup ctrl
sleep 1s
xdotool keydown n
sleep 0.2s
xdotool keyup n
sleep 1s
xdotool getactivewindow key ctrl+v
sleep 1s
xdotool keyup Ctrl
xdotool keyup Return
sleep 1s
xdotool key Ctrl+Return


sleep 3600s
# 1 hour in seconds

bash run.sh
