# noexif
noexif - clear all identifying EXIF data from an image on-demand, easily. 

[![Platform: GNU/Linux](https://img.shields.io/badge/platform-GNU/Linux-blue.svg)](www.kernel.org/linux.html)

REQUIRES and DEPENDS UPON ``libimage-exiftool-perl``, or a package that includes equivalent functionality of the ``exiftool`` command- be sure to have it installed. (On Fedora, for example, this package is known as ``perl-Image-ExifTool``)

# Setup
Append a line in your ``.bashrc``;

```nano /home/$(whoami)/.bashrc```

```alias noexif=alias noexif="exiftool -all= $1"```

After that, close and re-open all of your Terminal emulators to enable the command to work inside of them.

# Usage
You can clear all identifying EXIF data from an image at any time by opening a Terminal and typing the ``noexif your_image_name.png`` command, now.

