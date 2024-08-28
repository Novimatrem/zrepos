# ytdlmp3-command
ytdlmp3-command - easily download youtube content as mp3 audio. 

[![Platform: GNU/Linux](https://img.shields.io/badge/platform-GNU/Linux-blue.svg)](www.kernel.org/linux.html)

REQUIRES and DEPENDS UPON ``ffmpeg``, ``youtube-dl``, ``python-is-python3``- be sure to have them installed.

# Setup
Append a line in your ``.bashrc``;

```nano /home/$(whoami)/.bashrc```

```alias ytdlmp3=alias ytdlmp3="youtube-dl --extract-audio --audio-format mp3 $1"```

After that, close and re-open all of your Terminal emulators to enable the command to work inside of them.


# Usage
You can download something from YouTube as an MP3 at any time by opening a Terminal and typing something like

``ytdlmp3 https://www.youtube.com/watch?v=ozIZSVrLBio``

- as an example.


# Having trouble?
Sometimes Google/YouTube change-things-up to cause issues for open-source users and software. Be sure to UPDATE youtube-dl to the latest, with the following commands, if you encounter issues;

```sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl```

```sudo chmod a+rx /usr/local/bin/youtube-dl```

```sudo youtube-dl -U```


