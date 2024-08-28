---
layout: post
title:  "Fix missing music/sound effects in Source Engine games (Valve games, etc.) on Fedora"
date:   2022-03-25 08:15:00 +0000
---
#### by zoey Globe (novimatrem.uk)
*Released: 25/Mar/2022 at 08:15AM*

Hello- I've switched to using Fedora, kinda recently, and unfortunately, it has a bit of an issue regarding completely skipping playing certain audio files during Valve's games. None of this causes any crashing, but can lead to a worse gaming experience, confusion, and the appearance of buggyness- and generally isn't great. To work around this, please refer to the following steps, and all the games' audio will then work perfectly.

You need to open your Terminal emulator, either from the usual application menu place, or by using the keyboard shortcut Ctrl+Alt+T, or sometimes it's Super+T
AND THEN type the following into it, entering your password when it prompts you.

```

sudo su
sudo setsebool -P selinuxuser_execheap 1

```

That's it.
Your game will now function as intended, enjoy being able to hear the soundtracks, music, sound effects, etc! Especially 'Still Alive', and the banger that Half-Life 2's soundtrack is, amongst others.

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
