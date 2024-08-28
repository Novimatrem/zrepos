#!/bin/bash
# v32
cd "$(dirname "$0")"
rm -rf ./catme0
rm -rf ./catme1
cat textadv.sh | grep "QUERY" > catme0
clear
echo "List of all commands the game can understand so far:"
cat catme0 | cut -d '"' -f4
echo ""
echo "EXPAND YOUR TERMINAL TO SEE ALL"
rm -rf ./catme0
rm -rf ./catme1
