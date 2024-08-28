#!/bin/bash

# License information
# This product is licensed under the GNU GPL v3.0.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License (v3.0) for more details.
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see https://www.gnu.org/licenses/gpl-3.0.en.html.
# THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
# APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS
# AND/OR OTHER PARTIES PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND,
# EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE
# RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE
# PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
# REPAIR OR CORRECTION.

# Unmute the speakers
amixer set Master unmute

# Play voice with espeak
echo ""
echo Playing voice!
echo ""
TIMEHOURSPEAKY="$( date +'%l')"
TIMEDAYVALUE="$(date +”%A”)"
AMORPMVAR="$(date +"%p" | tr a-z A-Z | tr -d M)"
sleep 2s
paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while, which borks the whole script. It's silence.
espeak -p 66 -s 200 ". ... ."
sleep 2s
paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while, which borks the whole script. It's silence.
espeak -p 66 -s 200 ". ... ."
paplay --volume 65535 --latency-msec=40 $(pwd)/ben.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while, which borks the whole script.
sleep 2s
#notify-send "It's $TIMEHOURSPEAKY o'clock, on $TIMEDAYVALUE."
espeak -p 66 -s 150 "... it's $TIMEHOURSPEAKY o'clock.. ... . Stay hydrated"
sleep 0.4s
espeak -p 66 -s 150 "Drink water"
sleep 0.4s
# A or P for the first bit of the 12-hour time distinction
#espeak -p 66 -s 150 -z $(echo $AMORPMVAR)
sleep 0.1
# M for the second bit
#espeak -p 66 -s 150 "M"

sleep 1s
#espeak -p 66 -s 150 ", $TIMEDAYVALUE"

sleep 3s

killall espeak
killall speech-dispatcher

echo ""
echo "Removing messy non-required nohup.out!"
echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
echo ""
echo ""
sleep 0s && nohup echo "" && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out
echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
sleep 2s
echo "Removing messy non-required nohup.out!"

exit
