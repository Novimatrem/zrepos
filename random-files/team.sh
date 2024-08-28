#!/bin/bash
cd "$(dirname "$0")"

echo "Enter your password if prompted:"
sudo echo "Okay."

sudo apt install -y wget
sudo apt install -y gdebi

wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo gdebi -n teamviewer_amd64.deb

echo "Done."
