---
layout: post
title:  "How to fully properly disable Mouse Acceleration in most Linux distros & DE's"
date:   2020-08-22 01:10:00 +0100
---
#### by zoey Globe (novimatrem.uk)
*10 min read* | *Released: 22/Aug/2020 at 01:10AM GMT+1* | *Updated: 19/Apr/2021 at 08:18PM GMT+1*

Mouse acceleration is a default part of many desktop environments, and I don't believe it should be. In my opinion, an accelerated mouse behaviour is very difficult to consistently use accurately.

### What *is* mouse acceleration?
Mouse acceleration is a behaviour that is *supposed* to make it easier for beginners to use the mouse, but at the **severe cost** of accuracy and muscle memory. Mouse acceleration takes the *speed of your movement* into account, along with its distance, to calculate how the cursor (or camera/crosshair in a game) will move, which initially sounds like a good idea, but you then realize it makes it very difficult to become better at clicking specific locations, and moving the mouse reliably and consistently.

The mind, in most cases, can remember certain actions and movements you make with the mouse, if you make them consistently, if you learn and practice, most people refer to this as "muscle memory". But it is **much harder** to incorporate a consistent *speed of movement*, along with the movement distance itself, into muscle-memory. Most, if not all, professional gamers disable mouse acceleration on an OS level, and inside of their games. But disabling mouse acceleration can also be an applicable benefit to power-users of software who the inaccuracy of the mouse can be a problem.

In my opinion, mouse acceleration should be forcefully disabled, and never turned on again. This is critical if you wish to become better at using the mouse, using your mouse-driven software, gaming, and many more tasks, in an optimal and performant fashion.

**Now you're aware what mouse acceleration is, and why you want to disable it forever, let me fully explain how!**

##### (Note to experienced Linux users: ***You may see this post as being 'over-the-top' in the amount of steps in this guide, but I have had MANY experiences in which the simple GUI-only ways to do this have 'reset' and returned to the awful defaults, either with time, or when launching certain games/applications. I believe this blog post is one of the few to list the full comprehensive steps to be entirely acceleration-free, permanently.***)

# Instructions

There are many Linux desktop environments, window-managers, and the like- lots of compositors, lots of ways of handling user-input, such as there are many ways to perform *the following process*. I will be showing you the way that I recommend most, which should work fine for most users.

## Step 1 of 3 - In the GUI
The first (and simplest) step that I recommend is to **check your normal mouse-settings for an option to disable or reduce mouse acceleration**, if you didn't do this before reading my guide- take a good look, as you may have overlooked the option.

Many (but not all) desktop environments, especially as of recently, 
have included settings to disable mouse-acceleration in one way or another, (though, sometimes these distro-provided GUI methods of disabling/reducing mouse acceleration can tend to **reset**, sometimes- which is why this guide exists), the rest of this guide is steps of additional ways to ensure your mouse behaves as expected (non-accelerated). Some desktop environments refer to 'disabling mouse acceleration' as setting the mouse *acceleration profile* to "**flat**".

### Installing gnome-tweak-tool/gnome-tweaks

The first step in our guide **only really applies if you are using a GTK-based desktop**, but if you're *unsure*, it isn't harmful to do this regardless. We will be installing, and then using, the *GNOME Tweaks* package, otherwise known as *GNOME Tweak Tool*. Don't be alarmed if you don't run the GNOME desktop specifically, this tool can be safely used for many GTK desktops, and desktops based on GNOME itself.

The package we will need to install may have many dependencies, (such as installing the entire GNOME desktop!!), which we *do not* want, as we either are not using GNOME, **OR**, we already have it, either way there will be a flag to only get what is **required**, depending on your package manager, the flag for the apt package manager is ``--no-install-recommends``. 

We will need to install ``gnome-tweaks``, usually- but it can also be known as ``gnome-tweak-tool``, so try both package names if one doesn't work, and **be sure** to use the flag to only fetch *required* dependencies. As an example, the command you need to use on Ubuntu is: ``sudo apt install -y gnome-tweaks --no-install-recommends``

### Setting mouse acceleration profile to flat in GNOME Tweaks
After GNOME Tweaks has finished installing, open it from your applications menu/launcher- then go into the 'Keyboard & Mouse' category on the left side. Under the 'Mouse' subheading, set *Acceleration Profile* to 'flat', as demonstrated in the image below.

![](https://gitlab.com/Novimatrem/blog/-/raw/master/_postImagesUsed/how-to-fully-properly-disable-mouse-acceleration-in-most-linux-distros-and-de_image1.png)

## Step 2 of 3 - Permanently disabled by a script
Next I'll teach you how to quickly make a small script to **keep** mouse acceleration disabled, and how to run the script as a Startup Application, so that it will always be around keeping things good and proper.

### Own the directory where we will put the script

First, you'll want to create and own the ``/opt/`` folder, I find the /opt/ (optional software) folder a great place to put scripts that I make. 


Create the folder with the following command;

``sudo mkdir /opt/``

If the folder already exists, continue on regardless.

To take ownership of the ``/opt/`` folder so you can make edits there, use the commands;

``sudo chown $USER /opt/``

``sudo chown $USER /opt/*``


### Make the script

Now, we shall write a tiny script that will help keeping mouse acceleration set to 0 (disabled).

First, we will make and begin to edit the Bash script file;

``sudo nano /opt/disablemaccel.sh``

Simply copy-and-paste (Ctrl-C, then Ctrl-Shift-V) the following code into the editor;

```
while true; do sleep 1s && xset m 0 0 && gsettings set org.gnome.desktop.peripherals.mouse accel-profile flat; done
```

![](https://gitlab.com/Novimatrem/blog/-/raw/master/_postImagesUsed/how-to-fully-properly-disable-mouse-acceleration-in-most-linux-distros-and-de_image2.png)

After that, to save-and-quit from this editor, press Ctrl-X (together), then press Y to agree to save, and Enter to agree to save it in the right place.

To make this script be effective, it needs to be set to automatically run. You need to set the script as a startup program. How to do this *depends on your desktop environment*, but usually revolves around the concept of setting the following command **as a startup program in your startup-applications GUI**;

```
bash /opt/disablemaccel.sh
```

![](https://gitlab.com/Novimatrem/blog/-/raw/master/_postImagesUsed/how-to-fully-properly-disable-mouse-acceleration-in-most-linux-distros-and-de_image3.png)

# Step 3 of 3 - Disabled in the X11 config files

This third and final step applies to most login screens, and is a final permanent override for everything mouse-acceleration based in X11 (the window-system most distros default to).

If you're an *advanced user* and **you're sure** that you are ***not*** running with X11, then you should skip this section.

This step involves creating an X11 configuration file, and putting some code in it to tell X how to handle your mouse setup.

It only takes a few commands, typed in order- these commands will create the config-files folders, make the config file itself, and open it in ``nano`` for editing;

``sudo mkdir /usr/share/X11``

``sudo mkdir /usr/share/X11/xorg.conf.d``

``sudo touch /usr/share/X11/xorg.conf.d/50-mouse-acceleration.conf``

``sudo nano /usr/share/X11/xorg.conf.d/50-mouse-acceleration.conf``

We're back to the familiar nano text-editor again. This time, you'll want to paste the following piece of code into the file (Ctrl-C, then Ctrl-Shift-V);

```
Section "InputClass"
	Identifier "My Mouse"
	MatchIsPointer "yes"
	Option "AccelerationProfile" "-1"
	Option "AccelerationScheme" "none"
	Option "AccelSpeed" "-1"
EndSection
```

As before, to save and quit from the editor, press Ctrl-X (together), then press Y to agree to save, and Enter to agree to save it in the right place.

...

That's it! Process complete, all you need to do now is **restart your computer**, then you will (if you've followed all the steps correctly), **never experience mouse acceleration**.

## One final note
### (or- "some game developers are silly, and how to fix it")
***Some*** games (rarely, made/ported by bad or uncaring PC developers,) have their own **built-in mouse-acceleration**. This acceleration will have to be disabled on a case-by-case basis for games that do not comply with the global raw input that we established with the steps in this guide. Usually, the options to tweak the mouse behaviour to a favourable un-smoothed, non-accelerated, entirely-raw input are found in the game's menus, settings, configuration files, or by adding launch options to the game. There are a few games that I can recall with this issue, Bethesda's engine, Mirror's Edge, Fable's PC ports, etc.

A great resource for figuring out what the developers did to make your mouse feel awful to control, and instructions on how to fix it for almost every single game, can be found on the ever-wonderful pages of the <a href="https://www.pcgamingwiki.com/wiki/Home" style="color: #008148" target="_blank">PCGamingWiki (PCGW)</a>, which will help you get the most out of your games.

...

**That's all for this post, I hope you enjoy your newfound Linux gaming and computer software usage with *zero mouse acceleration*, and very precise accuracy (I certainly do!). I wish you a great week!**

Feel free to <a href="https://novimatrem.gitlab.io/blog/feed.xml" style="color: #008148" target="_blank">subscribe to my blog with RSS</a>

If you'd like to learn more of me, and the things I do, my website does a great job of that; <a href="https://novimatrem.uk/" style="color: #008148" target="_blank">https://novimatrem.uk/</a>

You can e-mail me with thoughts, feedback, etc. at [TheNovimatrem@protonmail.ch](mailto:TheNovimatrem@protonmail.ch)

...

This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License. (CC BY-SA 4.0)
<a href="https://creativecommons.org/licenses/by-sa/4.0/" style="color: #008148" target="_blank">https://creativecommons.org/licenses/by-sa/4.0/</a>

![face2024](https://gitlab.com/Novimatrem/blog/-/raw/master/face2024.png)
