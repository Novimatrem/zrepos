# converts batch adventure game (bag/bagroom) bchar art to SET 2 textadv.sh art
# unless you are zoey you will never need this

# v32

# cd to script dir
cd "$(dirname "$0")"

#sed -i -e 's/abc/XYZ/g' filetoconv.txt
#clear
#echo start
#echo ""
#echo "converting batch adventure game (bag/bagroom) bchar art to SET 2 textadv.sh art."

touch oldbagart.txt

rm -rf oldbagart.txt

cp -rf oldbagart-origver.txt oldbagart.txt

sed -i -e 's/%blockmaroon%/\\e[0m\e[101m/g' oldbagart.txt # FOX FUR COLOUR (MUST BE 101, FOXFUR RED)

sed -i -e 's/%blockwhite%/\\e[0m\e[107m/g' oldbagart.txt # IS BACKGROUND COLOR  (MUST BE 107, COMPLETE WHITE)

sed -i -e 's/%blockfuchisa%/\\e[0m\e[105m/g' oldbagart.txt # FOX EAR FLUFF COLOUR (MUST BE 105, FOXEAR PINK)

sed -i -e 's/%blockblack%/\e[0m\\e[108m /g' oldbagart.txt # IS IRIS AND MOUTH COLOR (MUST BE 108, COMPLETE BLACK)

sed -i -e 's/%blockgray%/\e[0m\\e[100m /g' oldbagart.txt # EYEBROW AND UNDERCHIN FLOOF COLOUR, MUST BE 100 (SILVER)

sed -i -e 's/%blocksilver%/\e[0m\\e[100m /g' oldbagart.txt # IS FACE FUR BEARD BOTTOM COLOR, MUST BE 100 (SILVER)

sed -i -e 's/&/\ /g' oldbagart.txt

# now we need to replace me with m\e
sed -i 's!me!m\\e!g' oldbagart.txt

# now we change that backslash into the forward slash
sed 's.\\./.g' oldbagart.txt > oldbagart-temp.txt

# fix slash directional final now
sed 's./.\\.g' oldbagart.txt > oldbagart-temp.txt

rm -rf oldbagart.txt

cp -rf oldbagart-temp.txt oldbagart.txt

rm -rf oldbagart-temp.txt

# fix missing slashes on some
sed -i -e 's/ e/\\e/g' oldbagart.txt

#echo "Done."
#echo ""

#echo "NOTE: this only converts colours used in the one image i drew, it does not do   all of them."
#echo "it is not rocket science to extend it to the rest, though, obviously."
#echo ""

#echo end
# EOF


