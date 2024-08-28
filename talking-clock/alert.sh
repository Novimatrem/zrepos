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

# Get the current time into TIMEHOURTIMEKEEPING and TIMEMINUTETIMEKEEPING
TIMEHOURTIMEKEEPING="$( date +'%H')"
TIMEMINUTETIMEKEEPING="$(date +'%M')"

# Debug, comment out in final, comment out above if using for testing.
#TIMEMINUTETIMEKEEPING="$(echo 01)"



# If not time minute at 01 (first minute of the hour), exit.
if ! [ "$TIMEMINUTETIMEKEEPING" == "01" ]; then exit; fi

# If time minute is at 01 (first minute of the hour), continue.
if [ "$TIMEMINUTETIMEKEEPING" == "01" ]; then echo "Running noisemaker!"; fi

# Play sound 
if [ "$TIMEMINUTETIMEKEEPING" == "01" ]; then bash noisemaker.sh; fi

# If not time minute 01 (first minute of the hour), sleep repeatedly until it changes.
if ! [ "$TIMEMINUTETIMEKEEPING" == "01" ]; then while ! $TIMEMINUTETIMEKEEPING == "*"; do sleep 1; done; fi

# boink
echo ""
# Sleep for an 58 mins to avoid accidental re-trigger
echo "Sleeping for 58 mins before checking for another alarm."
sleep 3480s

exit
