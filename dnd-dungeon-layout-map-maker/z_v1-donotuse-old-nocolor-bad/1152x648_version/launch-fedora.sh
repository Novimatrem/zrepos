#!/bin/bash
clear
echo "Preparing to start."
sudo echo "Starting..."

# Dev safety
killall idle3

# Install needed dnf deps
sudo dnf install -y pip
sudo dnf install -y python3-pip
sudo dnf install -y scrot

# Install needed pip3 deps
pip3 install arcade
pip3 install pyautogui
pip3 install pillow
pip3 install pyglet

# Setup
cd $(dirname $0); pwd
cp -rf 'gridback_orig.png' 'gridbacknew.png'
cp -rf 'gridback_orig.png' 'gridback.png'

echo "Done! Launching..."

while :
do
  clear
  python3 dnd-map-plotter-pixels.py
  clear
done

