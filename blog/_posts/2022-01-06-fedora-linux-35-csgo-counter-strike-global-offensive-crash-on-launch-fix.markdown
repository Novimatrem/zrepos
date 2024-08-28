---
layout: post
title:  "Fedora Linux 35 CS:GO Counter-Strike: Global Offensive crash-on-launch fix"
date:   2022-01-06 04:35:00 +0000
---
#### by zoey Globe (novimatrem.uk)
*Released: 06/Jan/2022 at 04:35AM GMT+0*

Hello- I've switched to using Fedora, recently, and unfortunately, Valve decided to put a library inside of the folder, rather than allowing the more up-to-date and more-compatible already-installed system library to be used, which I consider a bad practice. This causes CS:GO to crash on launch. To work around this, please refer to the following steps, and the game will work perfectly.

Put this in your CS:GO launch options or you will crash: ``-nojoy -novid -high -trusted``
AND THEN type the following, dependant on your games' location (change path if needed)
```
sudo su
dnf install gperftools-libs
cd ~/.steam/steam/steamapps/common/Counter-Strike\ Global\ Offensive/bin/linux64/
mv libtcmalloc_minimal.so.0 libtcmalloc_minimal.so.0.bak
mv libtcmalloc_minimal.so.4 libtcmalloc_minimal.so.4.bak
cp /usr/lib64/libtcmalloc_minimal.so.4.5.9 libtcmalloc_minimal.so.0
```

For example, here is the path for my hard-drive specifically,
```
sudo su
dnf install gperftools-libs
cd "/mnt/HDD_1TB_WD/SteamLibrary/steamapps/common/Counter-Strike Global Offensive/bin/linux64"
mv libtcmalloc_minimal.so.0 libtcmalloc_minimal.so.0.bak
mv libtcmalloc_minimal.so.4 libtcmalloc_minimal.so.4.bak
cp /usr/lib64/libtcmalloc_minimal.so.4.5.9 libtcmalloc_minimal.so.0
```

Your game will now function, enjoy~

Note: you will need to re-run this every single time the game updates.
valve pls fix

...

**That's all for this post, thanks for reading! I wish you a great week.**

Feel free to <a href="https://novimatrem.gitlab.io/blog/feed.xml" style="color: #008148" target="_blank">subscribe to my blog with RSS</a>

If you'd like to learn more of me, and the things I do, my website does a great job of that; <a href="https://novimatrem.uk/" style="color: #008148" target="_blank">https://novimatrem.uk/</a>

You can e-mail me with thoughts, feedback, etc. at [TheNovimatrem@protonmail.ch](mailto:TheNovimatrem@protonmail.ch)

...

This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License. (CC BY-SA 4.0)
<a href="https://creativecommons.org/licenses/by-sa/4.0/" style="color: #008148" target="_blank">https://creativecommons.org/licenses/by-sa/4.0/</a>

![face2024](https://gitlab.com/Novimatrem/blog/-/raw/master/face2024.png)
