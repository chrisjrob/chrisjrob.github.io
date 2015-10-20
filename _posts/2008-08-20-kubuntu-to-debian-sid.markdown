---
layout: post
title:  "Kubuntu to Debian Sid"
date:   2008-08-20 00:00:00
categories: technology floss linux 
tags: kubuntu debian sid xorg kde4
---

It's been bothering me for some time that I am using Kubuntu instead of Debian on my work desktop PC.  Yesterday I had a drive failure necessitating a reinstall; what better excuse could there be?  Having decided to change to Debian, I decided to install Sid, and then I decided that, as KDE 4.1 is now out, why not go the whole hog.

The experience was pretty positive, really the only problem was that I needed to tweak the `xorg.conf` in order to get my keyboard and mouse working, other than that it was a pretty straightforward install.

    Section "ServerLayout"
        Identifier   "Default Layout"
        Screen       "Default Screen"
        Inputdevice  "Generic Keyboard"
        Inputdevice  "Configured Mouse"
    EndSection

Installing VirtualBox was not such fun, but the following link sorted me out:

   * [Virtualbox OSE Debian Install](http://chirale.wordpress.com/2007/12/23/virtualbox-ose-debian-install-howto/)

So far I have installed Iceweasel3, OpenOffice3, NoMachine NX Client and VirtualBox, and it's running really nicely.  I have activated the KDE4 compositing effects, which seem very slow, so hopefully some room for improvement there in subsequent releases.

So would I recommend Debian Sid KDE4.1 over Kubuntu?  Well I think that's an unfair comparison, as I've installed a bleeding edge solution, but all-in-all it really wasn't a scary installation at all.

Well done to the Debian team.
