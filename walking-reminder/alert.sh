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

# Get the current time in 24 hours as a number.
TIMEHOURTIMEKEEPING="$( date +'%H')"

# Debug, comment out in final, comment out above if using for testing.
#TIMEHOURTIMEKEEPING="$(echo 12)"
#TIMEMINUTETIMEKEEPING="$(echo 30)"



# If not time hour at 12 (12), exit.
if ! [ "$TIMEHOURTIMEKEEPING" == "12" ]; then exit; fi

# If time hour is at 12 (12), continue.
if [ "$TIMEHOURTIMEKEEPING" == "12" ]; then echo "Running noisemaker!"; fi

# Play sound and show zenity box
if [ "$TIMEHOURTIMEKEEPING" == "12" ]; then bash noisemaker.sh; fi

# If not time hour 12 (12), sleep repeatedly until it changes.
if ! [ "$TIMEHOURTIMEKEEPING" == "12" ]; then while ! $TIMEHOURTIMEKEEPING == "*"; do sleep 1; done; fi

# The user dealt with Zenity, we kill music BUT NOT THE WHOLE SCRIPT, then resume as normal checking for time.
echo ""

echo "Killing paplay HARD to stop sounds."
echo ""
pkill paplay
killall paplay
kill -9 $(pgrep paplay)

echo ""

# Sleep for an hour and 2 mins to avoid accidental re-trigger
echo "Sleeping for 62 mins before checking for another alarm."
sleep 3720s

exit
