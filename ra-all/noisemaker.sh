#!/bin/bash

# Final check, for accuracy.
TIMEHOURTIMEKEEPING="$( date +'%H')"
TIMEMINUTETIMEKEEPING="$( date +'%M')"

# Debug, comment out in final, comment out above if using for testing.
TIMEHOURTIMEKEEPING="$(echo 06)"
TIMEMINUTETIMEKEEPING="$(echo 59)"

if ! [ "$TIMEHOURTIMEKEEPING" == "06" ]; then exit; fi
if ! [ "$TIMEMINUTETIMEKEEPING" == "59" ]; then exit; fi

# Wake the system (find a command for this, seems rare/non-existent)
echo "wake the system command goes here"

# Restart pulse before the alarm clock plays,
# to ensure we don't have a repeat of that day 
# where I didn't wake up, and missed my morning estrogen.
pulseaudio -k
killall pulseaudio
pkill pulseaudio
systemctl --user stop pulseaudio.service pulseaudio.socket
systemctl --user stop pulseaudio
systemctl --user restart pulseaudio
systemctl --user restart pulseaudio.service
systemctl --user restart pulseaudio.socket


# Unmute the speakers
amixer set Master unmute
amixer -q -D pulse sset Master unmute
pactl set-sink-mute 0 0
pactl set-sink-mute 1 0

# Speaker warming
cd "$(dirname "$0")"
paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
aplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
espeak -p 66 -s 200 ". ... ."
sleep 2s

# Speaker warming 2
cd "$(dirname "$0")"
paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
aplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
espeak -p 66 -s 200 ". ... ."
sleep 2s

# Set volume to reasonable percentage to wake me up, but not to deafen the neighborhood
echo ""
echo "Speaker volume to a %!"
echo ""
amixer -D pulse sset Master 153%

function flashing {
sleep 0.1
xrandr --output eDP-1 --brightness 1
xrandr --output HDMI-0 --brightness 1
xrandr --output DVI-D-0 --brightness 1
sleep 0.01
xrandr --output eDP-1 --brightness 0.3
xrandr --output HDMI-0 --brightness 0.3
xrandr --output DVI-D-0 --brightness 0.3
sleep 0.1
xrandr --output eDP-1 --brightness 1
xrandr --output HDMI-0 --brightness 1
xrandr --output DVI-D-0 --brightness 1
sleep 0.1
xrandr --output eDP-1 --brightness 0.3
xrandr --output HDMI-0 --brightness 0.3
xrandr --output DVI-D-0 --brightness 0.3
sleep 0.1
xrandr --output eDP-1 --brightness 1
xrandr --output HDMI-0 --brightness 1
xrandr --output DVI-D-0 --brightness 1
sleep 0.1
}

# Fluctuate brightness to alert me
flashing
cd "$(dirname "$0")"
sleep 0s && nohup bash /opt/alarm-clock/alsoradio.sh && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out && rm -rf /opt/nohup.out && disown & disown && echo ""
# Play fly.wav with paplay
amixer -D pulse sset Master 153%
echo ""
echo Playing fly.wav!
echo ""
echo "pwd is $(pwd), User- make sure fly.wav is there."
paplay --volume=999969.420 $(pwd)/fly.wav &
aplay --volume=999969.420 $(pwd)/fly.wav &
espeak -p 66 -s 200 ". ... ."
espeak -p 66 -s 150 "Wake up... . ... . "

# Fluctuate brightness to alert me
flashing

sleep 0s
espeak -p 66 -s 150 "Wake up... . ... . "

# Fluctuate brightness to alert me
flashing

sleep 0s
espeak -p 66 -s 150 "Wake up... . ... . "

# Fluctuate brightness to alert me
flashing

# Fluctuate brightness to alert me
flashing

# Fluctuate brightness to alert me
flashing

echo ""
echo "Removing messy non-required nohup.out!"
echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
echo "Popping zenity!"
echo ""
echo "Waiting for zenity to be dealt with (press OK or be closed), then we continue."
echo ""
notify-send "Wake up!"
sleep 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; sleep 1s ; kill -9 $pid
sleep 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; sleep 1s ; kill -9 $pid
sleep 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; sleep 1s ; kill -9 $pid
sleep 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; sleep 1s ; kill -9 $pid
sleep 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; sleep 1s ; kill -9 $pid
sleep 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; sleep 1s ; kill -9 $pid
sleep 0.2s
( speaker-test -t sine -f 1000 )& pid=$! ; sleep 1s ; kill -9 $pid


# m
sleep 0.2s
# this is what you get for waking up at 2pm
paplay --volume=999969.420 $(pwd)/m.wav &
aplay --volume=999969.420 $(pwd)/m.wav &
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
paplay --volume=999969.420 $(pwd)/m.wav &
aplay --volume=999969.420 $(pwd)/m.wav &
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
paplay --volume=999969.420 $(pwd)/m.wav &
aplay --volume=999969.420 $(pwd)/m.wav &
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
paplay --volume=999969.420 $(pwd)/m.wav &
aplay --volume=999969.420 $(pwd)/m.wav &
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
paplay --volume=999969.420 $(pwd)/m.wav &
aplay --volume=999969.420 $(pwd)/m.wav &
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
paplay --volume=999969.420 $(pwd)/m.wav &
aplay --volume=999969.420 $(pwd)/m.wav &
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
paplay --volume=999969.420 $(pwd)/m.wav &
aplay --volume=999969.420 $(pwd)/m.wav &
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
paplay --volume=999969.420 $(pwd)/m.wav &
aplay --volume=999969.420 $(pwd)/m.wav &
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
paplay --volume=999969.420 $(pwd)/m.wav &
aplay --volume=999969.420 $(pwd)/m.wav &
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
paplay --volume=999969.420 $(pwd)/m.wav &
aplay --volume=999969.420 $(pwd)/m.wav &
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /


sleep 0s && nohup zenity --warning --text "Wake up! Press space 30 times to turn-off." && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out
zenity --warning --text "Wake up! Press space 29 more times to turn-off..."
zenity --warning --text "Wake up! Press space 28 more times to turn-off..."
zenity --warning --text "Wake up! Press space 27 more times to turn-off..."
zenity --warning --text "Wake up! Press space 26 more times to turn-off..."
zenity --warning --text "Wake up! Press space 25 more times to turn-off..."
zenity --warning --text "Wake up! Press space 24 more times to turn-off..."
zenity --warning --text "Wake up! Press space 23 more times to turn-off..."
zenity --warning --text "Wake up! Press space 22 more times to turn-off..."
zenity --warning --text "Wake up! Press space 21 more times to turn-off..."
zenity --warning --text "Wake up! Press space 20 more times to turn-off..."
zenity --warning --text "Wake up! Press space 19 more times to turn-off..."
zenity --warning --text "Wake up! Press space 18 more times to turn-off..."
zenity --warning --text "Wake up! Press space 17 more times to turn-off..."
zenity --warning --text "Wake up! Press space 16 more times to turn-off..."
zenity --warning --text "Wake up! Press space 15 more times to turn-off..."
zenity --warning --text "Wake up! Press space 14 more times to turn-off..."
zenity --warning --text "Wake up! Press space 13 more times to turn-off..."
zenity --warning --text "Wake up! Press space 12 more times to turn-off..."
zenity --warning --text "Wake up! Press space 11 more times to turn-off..."
zenity --warning --text "Wake up! Press space 10 more times to turn-off..."
zenity --warning --text "Wake up! Press space 9 more times to turn-off..."
zenity --warning --text "Wake up! Press space 8 more times to turn-off..."
zenity --warning --text "Wake up! Press space 7 more times to turn-off..."
zenity --warning --text "Wake up! Press space 6 more times to turn-off..."
zenity --warning --text "Wake up! Press space 5 more times to turn-off..."
zenity --warning --text "Wake up! Press space 4 more times to turn-off..."
zenity --warning --text "Wake up! Press space 3 more times to turn-off..."
zenity --warning --text "Wake up! Press space 2 more times to turn-off..."
zenity --warning --text "Wake up! Press space 1 more times to turn-off..."
echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
sleep 0s
echo "Removing messy non-required nohup.out!"
echo ""
echo "Killing paplay HARD to stop fly.wav."
echo ""
pkill paplay
killall paplay
kill -9 $(pgrep paplay)
pkill aplay
killall aplay
kill -9 $(pgrep aplay)

# Amazing speech synthesis, this is.
sleep 1s
paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
aplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
espeak -p 66 -s 200 ". ... ."
sleep 2s
espeak -p 66 -s 200 ". ... ."
paplay $(pwd)/silence.wav
aplay $(pwd)/silence.wav
sleep 2s
espeak "Good morning! . ... . ...remember to check your to do list. . ... . ..."
sleep 1s
espeak "It's $(date +”%A”)"
sleep 2s

# Open to-do list (uncomment and change path to where your to-do list in PDF form is)
#sleep 0s && nohup atril /home/$(whoami)/Dropbox/Private-Novimatrem/my-stuff/docs/Schedule_Weekly_24_Hours_EDITED_300ppi_v20.pdf && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out && rm -rf /opt/nohup.out && disown & disown

# Daily fortune
#TODAYFORT="$(fortune -a)"
#nohup zenity --warning --text "$(echo $TODAYFORT)" & nohup espeak -p 66 -s 150 -g 3 "$(echo $TODAYFORT)"

echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
sleep 0s
echo "Removing messy non-required nohup.out!"
echo ""

killall espeak
killall speech-dispatcher
sleep 3720
exit
