#!/bin/bash

# requires wget to be installed
# and lynx
# and perl

clear

cd "$(dirname "$0")" # cd to directory of script file

rm -rf index.html # prep

rm -rf index.html.* # delete dupes wget likes to make

wget https://jlamothe.net/minetest/ # pull page with the real rules on them

rm -rf index.html.* # delete dupes wget likes to make

# cleanup my mess
rm -rf out.txt
rm -rf out2.txt
rm -rf out3.txt
rm -rf out4.txt
rm -rf out5.txt
rm -rf rules-section-as-code.txt
rm -rf lynxout.txt
rm -rf out6.txt
rm -rf news.txt

# succ logic

lynx -dump -nolist index.html > lynxout.txt

cat lynxout.txt > out.txt

fmt out.txt > out2.txt

fmt -u out2.txt > out3.txt

fmt -w 75 out3.txt > out4.txt

sed 's/*//g' out4.txt > out5.txt

# thank you mpy on superuser for this script.
chmod +x ./thanks-superuser
perl ./thanks-superuser "Server Guidelines" "on my website." < out5.txt > out6.txt

cat out6.txt > news.txt

# cleanup my mess
rm -rf out.txt
rm -rf out2.txt
rm -rf out3.txt
rm -rf out4.txt
rm -rf out5.txt
rm -rf rules-section-as-code.txt
rm -rf lynxout.txt
rm -rf out6.txt
rm -rf index.html

echo ""
echo "Finished. news.txt is up to date, and correctly formed for the game. It goes in your world folder's root, next to ipban.txt, players.sqlite, etc."
echo ""


# EOF
