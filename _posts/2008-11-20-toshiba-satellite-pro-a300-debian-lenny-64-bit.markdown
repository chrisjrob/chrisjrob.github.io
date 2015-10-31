---
layout: post
title:  "Toshiba Satellite Pro A300 / Debian Lenny 64-bit"
date:   2008-11-20 00:00:00
categories: technology linux
tags: toshiba laptop debian lenny 64-bit
---

The battery on my ageing Dell Inspiron 8200 had to be replaced recently, then the charger, and then (perhaps damage from cheap charger/battery?) the laptop died completely with amperage warnings about a month later.

<!--more-->

So I researched a replacement laptop, and ordered a Toshiba Satellite Pro A300, with 3gb RAM and 250gb hard drive.  I ordered with downgrade media to XP Pro.  Yes, anyone who has read my previous postings will appreciate just how appallingly hypocritical that is; but given that I will need XP to run under VirtualBox, and given that you don't seem to save any money by not having it, it made sense (even if it irks to be constantly adding to MS profits).

Tempted though I was to install Kubuntu 8.10 (my old laptop ran 8.04), I decided that the sensible thing to do (given KDE version) was to install Debian Lenny.  Obviously I had chosen a laptop which should be readily Linux compatible, so I did expect an easy time, and so it proved.  I decided to install the 64-bit version.

The installer picked up our DHCP server without a fuss, and prompted me to insert the non-free driver for the Intel wireless into a USB stick, which I did and it picked up without a fuss.  I asked the guided partitioner to give me a separate home, but apart from those two interactions, I just accepted the default for everything else.

I booted into Debian, and noticed that they have prettied kdm in the past few weeks, and even given kwin a new default wallpaper.  OpenOffice 2.4 and Iceweasel were already installed, so there really wasn't much else to do.

The good news is that, thus far at least, all the packages that I have wanted have been available (remember this is 64-bit).  As far as I know (I'm new to 64-bit) I have a pure 64-bit system.  It all seems very snappy, apart from OpenOffice, which takes a second or two to load.

The astonishing thing, and something that I have never seen mentioned in any Linux vs Windows review, is how quick it is to go from zero to actually having a fully productive machine.  Probably close to one hour.

There is one negative, which is that for some reason Debian Lenny 32-bit and 64-bit have a mismatch in versions between virtualbox-ose and virtualbox-ose-modules.  Such problems are only to be expected (Lenny hasn't been officially released yet) and I have checked that [there is a bug report logged][bug502346].  To fix the problem in the meantime:

    $ sudo aptitude remove virtualbox-ose-modules-2.6.26-1-amd64
    $ sudo rmmod vboxdrv
    $ sudo aptitude install build-essential module-assistant
    $ sudo aptitude install virtualbox-ose-source
    $ sudo module-assistant auto-install virtualbox-ose
    $ sudo dpkg -l virtualbox*  (check all are at same version)
    $ sudo modprobe vboxdrv

[bug502346]: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=502346
