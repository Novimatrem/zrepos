#!/bin/bash

# run-ra.sh

# for server

cd "$(dirname "$0")"

touch address.txt

touch address-name-when-cloned.txt

ADDR="$(cat address.txt)"

echo $ADDR



ADDRAC="$(cat address-name-when-cloned.txt)"

rmdir $ADDRAC
rm -rf $ADDRAC

clear
echo "Checking..."
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
cd ..
rmdir $ADDRAC
rm -rf $ADDRAC
clear
if [ "$TESTNOFINAL" == "0" ]; then echo "Alarm not started serverside." && echo ""
fi

if [ "$TESTNOFINAL" == "0" ]; then exit
fi

if [ "$TESTYESFINAL" == "1" ]; then bash run-alarm.sh
fi
clear



cd ..
rm -rf $ADDRAC
rmdir $ADDRAC
clear
if [ "$TESTYESFINAL" == "1" ]; then echo "Alarm started serverside, go go go!" && echo ""
fi

exit
exit



