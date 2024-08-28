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


# Script;Start

clear

# INTRO MESSAGE

echo "This product is licensed under the GNU GPL v3.0."
echo "( https://www.gnu.org/licenses/gpl-3.0.en.html )"
cd "$(dirname "$0")"
echo ""
ls
echo ""
CURPATH=$(pwd)
echo '$CURPATH is' && echo $CURPATH
echo ""

chmod +x alert.sh
chmod +x noisemaker.sh
chmod +x bedtime-reminder.sh

sleep 0s

# This entire script is a while true loop.
while true
do
echo "Current time hour is:"
# Get the current time in 24 hours as a number.
TIMEHOURTIMEKEEPING="$( date +'%H')"
TIMEMINUTETIMEKEEPING="$( date +'%M')"

# Debug, comment out in final, comment out above if using for testing.
#TIMEHOURTIMEKEEPING="$(echo 22)"
#TIMEMINUTETIMEKEEPING="$(echo 00)"

# Echo the gathered result.
echo $TIMEHOURTIMEKEEPING
echo ":"
echo $TIMEMINUTETIMEKEEPING

echo "(waiting for 21:00)"
echo ""

# Compare the TIMEHOURTIMEKEEPING with the hour that we wish to perform an action at.

# If at time hour 21, cont.
if [ $TIMEHOURTIMEKEEPING -eq 21 ]
then
if [ $TIMEMINUTETIMEKEEPING -eq 00 ]
then
    echo "Time is 21:00am, do attempt!"
    echo ""
    sleep 0s
    bash alert.sh
fi
fi

# Sleep for 1 second so we don't lag the system with very many checks.
    sleep 1
done

exit

