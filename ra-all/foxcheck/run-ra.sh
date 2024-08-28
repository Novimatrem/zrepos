#!/bin/bash

# run-ra.sh

# for him

cd "$(dirname "$0")"

while true
do




touch address.txt

touch address-name-when-cloned.txt

ADDR="$(cat address.txt)"

echo $ADDR



ADDRAC="$(cat address-name-when-cloned.txt)"

rmdir $ADDRAC
rm -rf $ADDRAC

clear
echo ""
echo "Checking if the foxcheck is set..."
echo ""
#git clone $ADDR

# bc his internet shitty
mkdir novimatrem.gitlab.io
cd novimatrem.gitlab.io
curl -O https://novimatrem.gitlab.io/index.html

echo ""


cd $ADDRAC

CHECK="index.html"

echo CHECK

RESULTIFNO="$(cat index.html | grep foxcheck0)"
RESULTIFYES="$(cat index.html | grep foxcheck1)"

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

cd ..
cd foxcheck
rmdir $ADDRAC
rm -rf $ADDRAC
clear
if [ "$TESTNOFINAL" == "foxcheck0" ]; then echo ""
fi

if [ "$TESTNOFINAL" == "foxcheck0" ]; then echo "Checking if the foxcheck is set..." && echo "" && echo "No, it isn't."
fi

if [ "$TESTYESFINAL" == "foxcheck1" ]; then bash run-alarm.sh
fi




cd ..
cd foxcheck
rm -rf $ADDRAC
#rmdir $ADDRAC

if [ "$TESTYESFINAL" == "foxcheck1" ]; then echo "Alarm started serverside, go go go!" && echo ""
fi


echo ""
echo Checking again in 1 minute...

sleep 5s # debug

#sleep 60s

done

exit
exit



