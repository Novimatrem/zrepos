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

echo "DEBUG: in noisemaker"

# actual, we probably don't need this here at this point
TIMEHOURTIMEKEEPING="$( date +'%H')"
TIMEMINUTETIMEKEEPING="$( date +'%M')"

# debug, we probably don't need this here at this point
#TIMEHOURTIMEKEEPING="$(echo 22)"
#TIMEMINUTETIMEKEEPING="$(echo 00)"


# Try to account for delays, to start making noise at exactly time
sleep 45s

# Wake the system (find a command for this, seems rare/non-existent)
echo "wake the system command goes here"

sleep 8s
sleep 4s

sleep 0s

# Unmute the speakers
amixer set Master unmute
amixer -q -D pulse sset Master unmute
pactl set-sink-mute 0 0
pactl set-sink-mute 1 0

# Speaker warming
cd "$(dirname "$0")"
paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
espeak -p 66 -s 200 ". ... ."
sleep 2s

# Speaker warming 2
cd "$(dirname "$0")"
paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while.
espeak -p 66 -s 200 ". ... ."
sleep 2s

# Play audio with paplay
echo ""
echo Playing audio!
echo ""
echo "pwd is $(pwd), User- make sure audio is there."
paplay --volume=67036 $(pwd)/fuck.wav &
espeak -p 66 -s 200 ". ... ."

echo ""
echo "Removing messy non-required nohup.out!"
echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
echo "Popping zenity!"
echo ""
echo "Waiting for zenity to be dealt with (press OK or be closed), then we continue."
echo ""
# zenity --warning --text "Don't forget to go take a shower, silly. When done, press OK."
paplay --volume=67036 $(pwd)/audio.wav &
notify-send "Brush your teeth, bitch! (Or you will lose them, and/or be in incredible pain.)"
sleep 0s && nohup zenity --warning --text "Brush your teeth, bitch! (Or you will lose them, and/or be in incredible pain.) Press space 5 times to close." && rm -rf $HOME/nohup.out && rm -rf $(pwd)/nohup.out
zenity --warning --text "Brush your teeth, bitch! (Or you will lose them, and/or be in incredible pain.) Press space 4 more times to close..."
zenity --warning --text "Brush your teeth, bitch! (Or you will lose them, and/or be in incredible pain.) Press space 3 more times to close..."
zenity --warning --text "Brush your teeth, bitch! (Or you will lose them, and/or be in incredible pain.) Press space 2 more times to close..."
zenity --warning --text "Brush your teeth, bitch! (Or you will lose them, and/or be in incredible pain.) Press space 1 more time to close..."
echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
sleep 0s
echo "Removing messy non-required nohup.out!"
echo ""
echo "Killing paplay HARD to stop audio."
echo ""
pkill paplay
killall paplay
kill -9 $(pgrep paplay)

sleep 1s
paplay $(pwd)/silence.wav
espeak -p 66 -s 200 ". ... ."
sleep 2s
espeak -p 66 -s 200 ". ... ."
paplay $(pwd)/silence.wav
sleep 2s
sleep 1s
sleep 2s

echo ""
rm -rf $HOME/nohup.out
rm -rf $(pwd)/nohup.out
sleep 0s
echo "Removing messy non-required nohup.out!"
echo ""

killall espeak
killall speech-dispatcher

# safety
sleep 62s

exit
