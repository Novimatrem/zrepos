#!/bin/bash
cd "$(dirname "$0")"
cd ./rem1
bash teeth.sh &

cd ..
cd ./rem2
bash teeth2.sh &


