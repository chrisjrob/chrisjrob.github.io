---
layout: post
title:  "Ubuntu Lucid Lynx"
date:   2010-06-16 00:00:00
category: technology
tags: [linux, ubuntu, broadcom, unetbootin, kde]
---

<img src="/assets/ubuntu1004_350.png" class="image-right" alt="Ubuntu 10.04">

As a died-in-the-wool KDE user, I'm just coming to terms with KDE4 and mostly loving it.  A few niggles remain, but in the main it is very good indeed.  But I suppose I would hesitate to recommend it to a new user.  Having seen and heard much praise for the latest Ubuntu 10.04 Lucid Lynx, which uses the Gnome desktop, I thought I'd give it a go.

<!--more-->

I started by downloading the ISO image from the Ubuntu website and followed my instructions to Make A Linux USB Key, basically by formatting in super-floppy format (which I find to be the most consistently successful method) and using Unetbootin to write the ISO to the USB Key.  Using a USB key is more convenient, more portable and more environmentally friendly than burning a CD/DVD.

I took a spare laptop, an HP NX7300, and inserted the USB Key.  I entered the BIOS settings and changed the boot order to boot first from USB.   I then booted up the laptop.

HP are not know for their Linux compatibility, but Ubuntu booted up with an attractive boot splash, before logging straight into the very attractively themed Gnome desktop.  The new colour scheme is purple, which is very attractive, although brown still exists in the OpenOffice splash screen to remind us of what used to be.

As expected, network manager failed to activate, and I knew from past experience that I would need to load the proprietary broadcom driver.  Continuing to play it dumb, I waited to see if I would get any help from Ubuntu.  After about half a minute, the restricted drivers' manager appeared on the top panel, although there was no guidance as to why it had appeared, nor what to do with it.  I clicked on it and then clicked on the option to install the Broadcom STR driver and clicked activate.

After a minute or so it had loaded the Broadcom driver from the USB stick and I noticed that the wireless light had illuminated on the laptop.  Promising!  Unfortunately it then suggested I reboot to load the new driver; which obviously I can't do, as I am running off a USB stick and would effectively start from scratch again if I rebooted.  I decided to just wait and, sure enough, after a while when I clicked on the wireless symbol on the top panel it offered my local wireless access point.  I selected it, and entered the encryption key, and I was connected.

At this point I had a completely usable desktop environment, including a full office suite (OpenOffice.org), a working web browser (Firefox) and everything else you could possibly wish in a modern desktop environment, all working off a USB stick.  I still find that just amazing.

I must admit that I am surprised by Gnome, it looks gorgeous, it feels very integrated, as if it had been designed as a whole, rather than being a collection of applications brought together.  No it's not my much loved Debian, and no it's not my much loved KDE, but it does feel easy to use, very uniform and just... well "right".

I was particularly impressed by Rhythmbox, which had the built in music store, podcast reader, and local collection.  This does look like an application which would reassure an erstwhile iTunes user.  It's probably not as good as amaroK, but having pushed amaroK on my mother and regretted it mightily, I think Rhythmbox is a good choice, being infinitely more user friendly.

I even set-up my Gmail account in Evolution, simply by clicking on the mail icon in the top panel and following the wizard to set up my Gmail account.  I played completely dumb, it provided all the necessary server information and network settings for me, and all I needed to know was my Gmail address and password.  That is incredible, anyone could set up their email if it's that easy.

Having tested it, just to decide whether to recommend it to friends and family, I find myself sorely tempted to install it on my own laptop.

