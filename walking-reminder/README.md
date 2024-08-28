# walking-reminder
Novimatrem's walking reminder script. - Licensed under the GNU GPL v3.0.

[![Platform: GNU/Linux](https://img.shields.io/badge/platform-GNU/Linux-blue.svg)](www.kernel.org/linux.html) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

REQUIRES and DEPENDS UPON ``zenity``, ``espeak``, ``paplay``, and ``bash``.

# The reminder currently triggers at 12:30 by default and there is no simple way to adjust this outside of editing the bash scripts manually in multiple places, at the moment. Sorry!

# Installation
Clone the contents of this repo into a folder where it will be safely accessible in the future; ``git clone https://gitlab.com/Novimatrem/walking-reminder``

I usually place it in; ``/opt/`` making the final path ``/opt/walking-reminder/``. 

**(If you've not already, you will need to take ownership of the ``/opt/`` folder before you can make edits there. To do so, use ``sudo chown $USER /opt/``, and ``sudo chown $USER /opt/*`` commands.)** 

Make a startup program using the "Startup Applications" GUI in which the command is ``bash /path/to/walking-reminder.sh`` (that command usually being ``bash /opt/walking-reminder/walking-reminder.sh``, then restart your computer.

# License (code)
[![GNU GPLv3 Image](https://www.gnu.org/graphics/gplv3-127x51.png)](http://www.gnu.org/licenses/gpl-3.0.en.html)  

**walking-reminder** is Free Software: You can use, study share and improve it at your
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

