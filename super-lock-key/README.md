# super-lock-key
bind the scroll-lock key (& a slk command) to MUTE ALL SOUND, MINIMIZE ALL WINDOWS, and TRIGGER THE LOCK-SCREEN. - Licensed under the GNU GPL v3.0.

[![Platform: GNU/Linux](https://img.shields.io/badge/platform-GNU/Linux-blue.svg)](www.kernel.org/linux.html) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

REQUIRES and DEPENDS UPON ``wmctrl``, ``xbindkeys``, ``bash``, and ``X11``- be sure to have them installed.

# Installation
Clone the contents of this repo;
``git clone https://gitlab.com/Novimatrem/super-lock-key``

Put `slk.sh` in a folder where it will be safely accessible in the future, I usually place it in;
``/opt/super-lock-key``
making the final path ``/opt/super-lock-key/slk.sh``.

**(If you've not already, you will need to take ownership of the ``/opt/`` folder before you can make edits there. To do so, use ``sudo chown $USER /opt/``, and ``sudo chown $USER /opt/*`` commands.)**

Append a line in your ``.bashrc`` to allow easily launching the script at any time; (alter the below depending on where you placed the script) 

```nano /home/$(whoami)/.bashrc```

```alias slk="bash /opt/super-lock-key/slk.sh"```


After that, close and re-open all of your Terminal emulators to enable the command to work inside of them.


Enter the following commands to append code into your ``.xbindkeysrc`` to allow launching this script with the Scroll Lock key;

```touch /home/$(whoami)/.xbindkeysrc```

```echo '"bash /opt/super-lock-key/slk.sh"' >> /home/$(whoami)/.xbindkeysrc```

```echo -e ' \t Scroll_Lock' >> /home/$(whoami)/.xbindkeysrc```


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
You can use the ``Scroll Lock key``, or the ``slk`` command, to forcefully hide all windows, lock the system, & mute the sound, all at once, now.

# License (code)
[![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl-3.0.en.html)  

**super-lock-key** is Free Software: You can use, study share and improve it at your
will. Specifically you can redistribute and/or modify it under the terms of the
[GNU General Public License](https://www.gnu.org/licenses/gpl.html) as
published by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This product is licensed under the GNU GPL v3.0.
This program is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 

See the GNU General Public License (v3.0) for more details. 
You should have received a copy of the GNU General Public License along with
this program.  If not, see [https://www.gnu.org/licenses/gpl-3.0.en.html](https://www.gnu.org/licenses/gpl-3.0.en.html). 

THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS
AND/OR OTHER PARTIES PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE 
RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU. SHOULD THE
PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
REPAIR OR CORRECTION. 


