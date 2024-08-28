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
clear
clear
echo ""
echo "Checking if the foxcheck is set..."
echo ""
echo "Something's wrong, the foxcheck is 1. Informing client."
echo ""
echo "Warming up notification system..."
echo ""
echo "wake the system command goes here"

# Restart pulse before the alarm clock plays,
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

# Fluctuate brightness to alert me
flashing
cd "$(dirname "$0")"
amixer -D pulse sset Master 153%
echo ""
echo ""
espeak -p 66 -s 200 ". ... ."

# Fluctuate brightness to alert me
flashing

sleep 0s

# Fluctuate brightness to alert me
flashing

sleep 0s

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
echo ""
echo ""
sleep 0.2s


# m
sleep 0.2s
# this is what you get for waking up at 2pm
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /



# m
sleep 0.2s
# this is what you get for waking up at 2pm
espeak -p 66 -s 200 ". ... ."
sleep 0.2s
# /


echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
sleep 0s
echo "Removing messy non-required nohup.out!"
echo ""
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
sleep 1s
sleep 2s

# Open to-do list (uncomment and change path to where your to-do list in PDF form is)
#sleep 0s && nohup atril /home/$(whoami)/Dropbox/Private-Novimatrem/my-stuff/docs/Schedule_Weekly_24_Hours_EDITED_300ppi_v20.pdf && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out && rm -rf /opt/nohup.out && disown & disown

# Daily fortune
#TODAYFORT="$(fortune -a)"

echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
sleep 0s
echo "Removing messy non-required nohup.out!"
echo ""

killall espeak
killall speech-dispatcher
echo ""
paplay $(pwd)/c.wav
powershell -c "(New-Object Media.SoundPlayer c.wav).PlaySync();" &
clear
echo "If you are reading this and have heard the sound, it's because zoey needs you. Critically."
echo ""
echo "So uh, go deal with that, sorry."
echo ""
echo "This foxcheck has finished executing. I'll start checking once again in an hour."
echo "Do not close this Terminal, will resume automatically."
sleep 3720
exit

# EOF
echo EOF



