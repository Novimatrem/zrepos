#!/bin/bash

# talking-clock is a talking clock script that speaks the time every hour. 
# Requires espeak & paplay, libnotify-bin (notify-send), oh- and bash of course.

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


# Script;Start

clear

# INTRO MESSAGE
echo "talking-clock is a talking clock script that speaks the time every hour."
echo "Requires espeak & paplay, libnotify-bin (notify-send), oh- and bash of course."
echo ""
echo "This product is licensed under the GNU GPL v3.0."
echo "( https://www.gnu.org/licenses/gpl-3.0.en.html )"
cd "$(dirname "$0")"
echo ""
ls
echo ""
CURPATH=$(pwd)
echo '$CURPATH is' && echo $CURPATH
echo ""


sleep 2s

# This entire script is a while true loop.
while true
do
echo "Time is;"
echo ""
# Get the current time into TIMEHOURTIMEKEEPING and TIMEMINUTETIMEKEEPING
TIMEHOURTIMEKEEPING="$( date +'%H')"
TIMEMINUTETIMEKEEPING="$(date +'%M')"

# Debug, comment out in final, comment out above if using for testing.
#TIMEMINUTETIMEKEEPING="$(echo 01)"

# Echo the gathered result.
echo $TIMEHOURTIMEKEEPING
echo ":"
echo $TIMEMINUTETIMEKEEPING
echo ""
echo "(waiting for first minute of each hour)"
echo ""

# Compare the TIMEMINUTETIMEKEEPING with the hour that we wish to perform the action at.

# If at time minute at 01 (first minute of the hour), alert.
if [ $TIMEMINUTETIMEKEEPING -eq 01 ]
then
    echo "It's the first minute of a new hour, do alert!"
    echo ""
    sleep 2s
    paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while, which borks the whole script. It's silence.
    sleep 2s
    paplay $(pwd)/silence.wav # Play a sound so my desktop speakers won't miss the first 3 seconds of audio if left for a while, which borks the whole script. It's silence.
    sleep 2s
    bash alert.sh
fi

# Sleep for 1 second so we don't lag the system with very many checks.
    sleep 1
done

exit

