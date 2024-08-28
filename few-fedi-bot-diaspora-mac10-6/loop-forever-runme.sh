#!/bin/bash

# the script that runs
# futa-every-word-bot-for-diaspora_macOS-10-6-snow-leopard-applescript

# remember: set the mac to never go off/to sleep, never have it be interrupted
# have firefox open, on SPECIFICALLY THIS PAGE: https://iviv.hu/status_messages/new , 
# with the main posting box selected, cursor flashing.
#
# (ensure you make it be using the Mobile version of disapora, normal one no worky on old browser)
# (it's set by a cookie so you only have to make it use mobile once, if the posting box shows up you good)
#

# pcheck
clear
echo "Dict last updated time: $(stat -f "%Sm" -t "%c" "/usr/share/dict/words")"
echo "OS install time:        Sun Nov 27 14:15:24 2022"
echo ""
echo "If these match, you're good."
echo ""
while true
do
sleep 1

echo "Loop restarted. Time to run the bot again!"
sleep 2s
osascript diasporabot.scpt
sleep 2s
echo "$(date) - '$(cat randword.txt) futa'"
echo "Waiting 4 hours."
sleep 15s
sleep 14400s # 4 hours in seconds

sleep 1
done
