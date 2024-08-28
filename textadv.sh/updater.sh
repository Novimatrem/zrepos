#!/bin/bash
# updater.sh v32 awesome edition
# Please run the updater from in-game with the command: dev update

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

if [ "$UPDATESEQUENCE" = "" ]; then
clear
echo "Please run the updater from in-game with the command: dev update"
UPDATESEQUENCE=0
export UPDATESEQUENCE=0
exit
fi

if [ "$UPDATESEQUENCE" = "0" ]; then
clear
echo "Please run the updater from in-game with the command: dev update"
UPDATESEQUENCE=0
export UPDATESEQUENCE=0
exit
fi

if [ "$UPDATESEQUENCE" = "1" ]; then
echo "We are updating now."
echo ""
cd "$(dirname "$0")"

rm -rf updater.sh
curl -O https://gitlab.com/Novimatrem/textadv.sh/-/raw/main/updater.sh

# Yes, I'm doing this like this, programmer friend. I'm being very careful. Purposefully.

# duki nuki
cd "$(dirname "$0")"
echo "Working..."
rm -rf lots-of-dots.txt
rm -rf bag-art-convert.sh
rm -rf edit-script-haiku.sh
rm -rf get-command-listing.sh
rm -rf gpgf.sh
rm -rf oldbagart-origver.txt
rm -rf testfile-garbage-ignore.txt
rm -rf testfile-garbage-ignore2.txt
rm -rf testfile-garbage-ignore3.txt
rm -rf testfile-garbage-ignore4.txt
rm -rf testfile-garbage-ignore5.txt
rm -rf testfile-garbage-ignore6.txt
rm -rf oldbagart.txt
rm -rf open-dir-haiku.sh
rm -rf README.md
rm -rf run-win-LTSC-enterprise.bat
rm -rf run-win-zoey.bat
rm -rf start.sh
rm -rf textadv.sh
rm -rf updater.sh
rm -rf .git
rm -rf ../update-process
# /duki nuki

# download
cd ..
mkdir update-process
cd update-process
git clone https://gitlab.com/Novimatrem/textadv.sh
cd textadv.sh
rm -rf updater.sh
curl -O https://gitlab.com/Novimatrem/textadv.sh/-/raw/main/updater.sh
unalias cp

# HERE IS THE WRITE

yes | cp -rf lots-of-dots.txt ../../textadv.sh/lots-of-dots.txt
yes | cp -rf bag-art-convert.sh ../../textadv.sh/bag-art-convert.sh
yes | cp -rf edit-script-haiku.sh ../../textadv.sh/edit-script-haiku.sh
yes | cp -rf get-command-listing.sh ../../textadv.sh/get-command-listing.sh
yes | cp -rf gpgf.sh ../../textadv.sh/gpgf.sh
yes | cp -rf oldbagart-origver.txt ../../textadv.sh/oldbagart-origver.txt
yes | cp -rf testfile-garbage-ignore.txt ../../textadv.sh/testfile-garbage-ignore.txt
yes | cp -rf testfile-garbage-ignore2.txt ../../textadv.sh/testfile-garbage-ignore2.txt
yes | cp -rf testfile-garbage-ignore3.txt ../../textadv.sh/testfile-garbage-ignore3.txt
yes | cp -rf testfile-garbage-ignore4.txt ../../textadv.sh/testfile-garbage-ignore4.txt
yes | cp -rf testfile-garbage-ignore5.txt ../../textadv.sh/testfile-garbage-ignore5.txt
yes | cp -rf testfile-garbage-ignore6.txt ../../textadv.sh/testfile-garbage-ignore6.txt

yes | cp -rf oldbagart.txt ../../textadv.sh/oldbagart.txt
yes | cp -rf open-dir-haiku.sh ../../textadv.sh/open-dir-haiku.sh
yes | cp -rf README.md ../../textadv.sh/README.md
yes | cp -rf run-win-LTSC-enterprise.bat ../../textadv.sh/run-win-LTSC-enterprise.bat
yes | cp -rf run-win-zoey.bat ../../textadv.sh/run-win-zoey.bat
yes | cp -rf start.sh ../../textadv.sh/start.sh
yes | cp -rf ./textadv.sh ../../textadv.sh/textadv.sh
yes | cp -rf updater.sh ../../textadv.sh/updater.sh

# /HERE IS THE WRITE

cd ..
cd ..
rm -rf update-process


# and now we do it again to ensure that the newly updated updater's new file index is downloaded.
# this means i can add NEW FILES on the fly without having to have anyone redownload.


# Yes, I'm doing this like this, programmer friend. I'm being very careful. Purposefully.

# duki nuki
echo "Working..."
rm -rf lots-of-dots.txt
rm -rf bag-art-convert.sh
rm -rf edit-script-haiku.sh
rm -rf get-command-listing.sh
rm -rf gpgf.sh
rm -rf oldbagart-origver.txt
rm -rf testfile-garbage-ignore.txt
rm -rf testfile-garbage-ignore2.txt
rm -rf testfile-garbage-ignore3.txt
rm -rf testfile-garbage-ignore4.txt
rm -rf testfile-garbage-ignore5.txt
rm -rf testfile-garbage-ignore6.txt
rm -rf oldbagart.txt
rm -rf open-dir-haiku.sh
rm -rf README.md
rm -rf run-win-LTSC-enterprise.bat
rm -rf run-win-zoey.bat
rm -rf start.sh
#rm -rf textadv.sh NOPE NOT THIS TIME
rm -rf updater.sh
rm -rf .git
rm -rf ../update-process
# /duki nuki

# download
cd ..
mkdir textadv.sh
cd textadv.sh
mkdir update-process
cd update-process
git clone https://gitlab.com/Novimatrem/textadv.sh
cd textadv.sh
rm -rf updater.sh
curl -O https://gitlab.com/Novimatrem/textadv.sh/-/raw/main/updater.sh
unalias cp


echo ZOEY WE ARE HERE
pwd
set +x
unalias ls
ls
sleep 3s

# HERE IS THE WRITE 2

yes | cp -rf lots-of-dots.txt ../../lots-of-dots.txt
yes | cp -rf bag-art-convert.sh ../../bag-art-convert.sh
yes | cp -rf edit-script-haiku.sh ../../edit-script-haiku.sh
yes | cp -rf get-command-listing.sh ../../get-command-listing.sh
yes | cp -rf gpgf.sh ../../gpgf.sh
yes | cp -rf oldbagart-origver.txt ../../oldbagart-origver.txt
yes | cp -rf testfile-garbage-ignore.txt ../../testfile-garbage-ignore.txt
yes | cp -rf testfile-garbage-ignore2.txt ../../testfile-garbage-ignore2.txt
yes | cp -rf testfile-garbage-ignore3.txt ../../testfile-garbage-ignore3.txt
yes | cp -rf testfile-garbage-ignore4.txt ../../testfile-garbage-ignore4.txt
yes | cp -rf testfile-garbage-ignore5.txt ../../testfile-garbage-ignore5.txt
yes | cp -rf testfile-garbage-ignore6.txt ../../testfile-garbage-ignore6.txt

yes | cp -rf oldbagart.txt ../../oldbagart.txt
yes | cp -rf open-dir-haiku.sh ../../open-dir-haiku.sh
yes | cp -rf README.md ../../README.md
yes | cp -rf run-win-LTSC-enterprise.bat ../../run-win-LTSC-enterprise.bat
yes | cp -rf run-win-zoey.bat ../../run-win-zoey.bat
yes | cp -rf start.sh ../../start.sh
yes | cp -rf ./textadv.sh ../../textadv.sh
yes | cp -rf updater.sh ../../updater.sh

# /HERE IS THE WRITE 2

cd ..
cd ..
rm -rf update-process




echo ""
echo "Done. Start the game again, it's the newest version now."
fi

# Cleanup and finish.
UPDATESEQUENCE=0
export UPDATESEQUENCE=0
exit

# EOF
