# batch-alarm-clock

batch-alarm-clock, yes, at 1:30 AM (until 3:30 AM), i had the idea to make an alarm clock in a batch script based text adventure game engine that i made, and it actually works [on windows], if you want to wake up, this will help. yes, i'm crazy.

# Video evidence

You can see the script running in this video here: [https://youtu.be/wAnp2uk_kQE](https://youtu.be/wAnp2uk_kQE)

# Wine on Linux support

Newly working on Linux thanks to Raku (@woah@udongein.xyz) with the version in the _linux-wine-version folder, thank you so much!

# Running every day

This script cannot yet tell the difference between AM and PM, though it does close itself after each time the alarm goes off, so: If you schedule the script to open at 10 PM every day (so it doesn't trigger by thinking it's 9AM early.) then you can have this script be your alarm clock every day. Essentially, use the Task Scheduler to make the script run at the hour in the PM that is 1 hour later than you wish to wake up in the AM, so you'd set it in task scheduler to open at 10 PM by default. (Or just open it manually before you sleep after 10PM.)

![automatic setting example](https://gitlab.com/Novimatrem/batch-alarm-clock/-/raw/main/auto-screen.png)
