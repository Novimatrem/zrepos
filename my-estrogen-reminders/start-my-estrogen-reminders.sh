#!/bin/bash
cd "$(dirname "$0")"
chown $USER start-my-estrogen-reminders.sh
chown $USER:$USER start-my-estrogen-reminders.sh
chown $USER start-my-estrogen-reminders.sh
chmod +x start-my-estrogen-reminders.sh
cd ./my-deps

bash ./A9/alarm-clock.sh &
bash ./B3/alarm-clock.sh &
bash ./C9/alarm-clock.sh &

# MULTIPROCESS POWERRR!



