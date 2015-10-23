---
layout: post
title:  "Home Theatre PC - Setting DPI in Xorg"
date:   2010-05-22 00:00:01
categories: technology linux mythtv
tags: nvidia hdmi
---

A second post on the same day, has hell frozen over?  No, actually I put the wrong date on yesterday's post.  Oops.

The DPI problem was fixed very easily by following the instructions on the link I provided in my previous post, I calculated that my Sony Bravia KDL 32S3000 had dimensions of 700mm x 390mm and a native resolution of 1366x768.

    $ xdpyinfo | grep dimensions
    $ xdpyinfo | grep "dots per inch"

Converting the millimetres to inches and dividing the resolution by the inches dimensions gave me DPI of 50x50, surprisingly low.  I believe this is because the KDL 32S3000 is not a full HD TV but only 1080i.  Setting this in `/etc/X11/xorg.conf` cured the problem with the KDM login manager.

    Section "Monitor"
        Identifier "Monitor0"
        Option   "DPI" "50 x 50"
    EndSection

