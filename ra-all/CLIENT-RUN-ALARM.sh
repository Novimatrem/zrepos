#!/bin/bash

# CLIENT-RUN-ALARM.sh

# for client

cd "$(dirname "$0")"

touch address.txt

touch address-name-when-cloned.txt

ADDR="$(cat address.txt)"

echo $ADDR



ADDRAC="$(cat address-name-when-cloned.txt)"

rmdir $ADDRAC
rm -rf $ADDRAC

clear
echo "Loading..."
echo ""
git clone $ADDR
echo ""
clear

cd $ADDRAC

CHECK="index.html"

echo CHECK

RESULTIFNO="$(cat index.html | grep 0)"
RESULTIFYES="$(cat index.html | grep 1)"

echo RESULTIFNO
echo $RESULTIFNO > testno.txt

echo RESULTIFYES
echo $RESULTIFYES > testyes.txt


TESTNOFINAL=""$(echo -ne $(cat testno.txt))""
TESTYESFINAL=""$(echo -ne $(cat testyes.txt))""

echo tyf
echo $TESTYESFINAL

echo tnf
echo $TESTNOFINAL




echo TEST YES FINAL:
echo $TESTYESFINAL
clear

clear

echo "Updating the alarm clock to be ON."
echo ""
#pwd
#ls

cd "$(dirname "$0")"
cd $ADDRAC

rm -rf testyes.txt
rm -rf testno.txt

rm -rf index.html
touch index.html

echo "1" > index.html

echo ""
clear
echo "To set off alarm,"
echo "Enter your GitHub personal access token info now."
echo "(if prompted)"
echo ""

cd "$(dirname "$0")"

# ugly hax
cd ra-all
cd $ADDRAC
# /ugly hax

pwd 

echo ""
git add --all
git commit -m "update"
git push -u origin main
echo ""
clear
echo "It's alarming!"
echo "Now wait a few minutes with this script open,"
echo "so the other end has time to play it."
echo ""
echo "(waiting 6 minutes, DO NOT CLOSE SCRIPT)"

sleep 180s
sleep 180s


clear
echo "Should've been long enough."

echo "Turn off her alarm? (y)"

echo "enter the letter y to confirm."


while true; do
    read -p "? (y) " yn
    case $yn in
        [Yy]* ) echo "cont"; break;;
        * ) echo "Please answer.";;
    esac
done


cd "$(dirname "$0")"

# ugly hax
cd ra-all
cd $ADDRAC
# /ugly hax

pwd


echo "0" > index.html

echo ""
clear
echo "To disable the alarm,"
echo "Enter your GitHub personal access token info now."
echo "(if prompted)"
echo ""
git add --all
git commit -m "update"
git push -u origin main

rm -rf $ADDRAC
rmdir $ADDRAC


exit
exit



