# dvorak-qwerty-switch-aliases
Switch to dvorak, or to qwerty, reliably. (made this mostly for games that hate dvorak, or if friends come over.) - Licensed under the GNU GPL v3.0.

[![Platform: GNU/Linux](https://img.shields.io/badge/platform-GNU/Linux-blue.svg)](www.kernel.org/linux.html) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Installation
Clone the contents of this repo;
``git clone https://gitlab.com/Novimatrem/dvorak-qwerty-switch-aliases``

Run the following command, only once, and configure it how you wish;
``sudo dpkg-reconfigure keyboard-configuration``

Then, put `to-dvorak.sh` and `to-qwerty.sh` from the cloned repo in a folder where it will be safely accessible in the future, I usually place it in;
``/opt``
making the final paths ``/opt/to-dvorak.sh`` and ``/opt/to-qwerty.sh``.

**(If you've not already, you will need to take ownership of the ``/opt/`` folder before you can make edits there. To do so, use ``sudo chown $USER /opt/``, and ``sudo chown $USER /opt/*`` commands.)**

Append two lines in your ``.bashrc`` to allow easily switching at any time; (alter the below depending on where you placed the script) 

```nano /home/$(whoami)/.bashrc```

```alias dvorak="bash /opt/to-dvorak.sh"```

```alias qwerty="bash /opt/to-qwerty.sh"```


After that, close and re-open all of your Terminal emulators to enable the command to work inside of them.


# Usage
You can change keyboard layout between those two at any time by opening a Terminal and typing the ``dvorak`` and ``qwerty`` commands, now. You MAY WISH to copy these the first time, and use them from your bash *history* (up-arrows+enter), instead, so that your keyboard layout can be changed without pressing any layout-specific keys.

# UPDATE: Want to switch layouts using this script with an easy keyboard shortcut?
Check out the following repo if you'd like to be able to do what this script does, but bound to a key-combo too!- 
https://gitlab.com/Novimatrem/dvorak-qwerty-switch-keybind

# Demonstration GIF
![Demonstration GIF](https://gitlab.com/Novimatrem/dvorak-qwerty-switch-aliases/-/raw/master/demonstration.gif)

# License (code)
[![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl-3.0.en.html)  

**dvorak-qwerty-switch-aliases** is Free Software: You can use, study share and improve it at your will. Specifically you can redistribute and/or modify it under the terms of the
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

