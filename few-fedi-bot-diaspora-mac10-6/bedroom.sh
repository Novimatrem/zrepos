# because bedroom

clear
echo "I sleep in this room. Preparing Mac to make that good."
echo ""

# mute speakers, i sleep in this room
osascript -e "set Volume 0"
echo "Volume muted."
echo ""


# get the brightness right, i sleep in this room
echo "Setting brightness (will take some time!)"

echo "First we brighten so the system is at a known starting brightness."

for i in {1..115}; do
echo "Brightening (system may appear unresponsive, but it is fine! please wait patiently)"
for run in {1..100}; do sleep 0s && osascript -e 'tell application "System Events"' -e 'activate key code 113' -e ' end tell' && sleep 0s; done
sleep 2s
done

echo "Then we darken to the bottom level to get a known starting brightness from there."

read -rsp "Darken now? Enter is yes, Ctrl-C for no."

for i in {1..115}; do
echo "Darkening (system may appear unresponsive, but it is fine! please wait patiently)"
for run in {1..100}; do sleep 0s && osascript -e 'tell application "System Events"' -e 'activate key code 107' -e ' end tell' && sleep 0s; done
sleep 2s
done


echo "we brighten fully in 15 seconds, CTRL C NOW IF YOU LIKE THIS BRIGHTNESS"

sleep 15s
echo "we brighten fully"

for i in {1..115}; do
echo "Brightening (system may appear unresponsive, but it is fine! please wait patiently)"
for run in {1..100}; do sleep 0s && osascript -e 'tell application "System Events"' -e 'activate key code 113' -e ' end tell' && sleep 0s; done
sleep 2s
done


echo "Done."
