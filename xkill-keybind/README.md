# xkill-keybind
xkill-keybind - bind Ctrl+Shift+X to 'xkill'

[![Platform: GNU/Linux](https://img.shields.io/badge/platform-GNU/Linux-blue.svg)](www.kernel.org/linux.html)

REQUIRES and DEPENDS UPON ``xbindkeys`` and ``a working xkill command``- be sure to have them installed.

# Installation
**Step 1:**
Enter the following commands to append code into your ``.xbindkeysrc`` to allow the magic to work with the right key combo;

```touch /home/$(whoami)/.xbindkeysrc```

```echo '"xkill"' >> /home/$(whoami)/.xbindkeysrc```

```echo -e ' \t Control + Shift + X' >> /home/$(whoami)/.xbindkeysrc```

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
You can use the ``Control`` + ``Shift`` + ``X`` key combo (three keys at the same time) to run xkill, then left click a window to kill it. Enjoy!
