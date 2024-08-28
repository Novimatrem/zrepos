# dvorak-qwerty-switch-keybind
dvorak-qwerty-switch-keybind - switch to dvorak, or to qwerty, reliably- with a simple any-time key combo. (made this mostly for games that hate dvorak, or if friends come over.) - Licensed under the GNU GPL v3.0.

[![Platform: GNU/Linux](https://img.shields.io/badge/platform-GNU/Linux-blue.svg)](www.kernel.org/linux.html) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

REQUIRES and DEPENDS UPON ``xbindkeys``- be sure to have it installed.

# Installation
**Step 1:** First, you will want to visit and install (follow the readme) the following: https://gitlab.com/Novimatrem/dvorak-qwerty-switch-aliases/ - as that script is a required dependency of this repo's tutorial.

**Step 2:**
Enter the following commands to append code into your ``.xbindkeysrc`` to allow the magic to work with the right key combo;

```touch /home/$(whoami)/.xbindkeysrc```

```echo '"bash /opt/to-dvorak.sh"' >> /home/$(whoami)/.xbindkeysrc```

```echo -e ' \t Control + Shift + F1' >> /home/$(whoami)/.xbindkeysrc```

```echo '"bash /opt/to-qwerty.sh"' >> /home/$(whoami)/.xbindkeysrc```

```echo -e ' \t Control + Shift + F2' >> /home/$(whoami)/.xbindkeysrc```

Then run this command to make sure the keybind persists through reboots;

``xbindkeys_autostart``

Now we need to restart xbindkeys for the changes to take effect.

Kill all existing instances of xbindkeys with the following commands; 

```killall xbindkeys```

```pkill xbindkeys```

and then run it again, so you can make use of the keybind in your current session;

```xbindkeys```

That's it!

# Usage
You can use the ``Control`` + ``Shift`` + ``F1`` key combo (three keys at the same time) to switch to Dvorak, and the ``Control`` + ``Shift`` + ``F2`` key combo (three keys at the same time) to switch to QWERTY. Enjoy!

