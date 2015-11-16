---
layout: post
title:  "Improving boot performance"
date:   2009-04-14 00:00:00
category: technology
tags: [linux, grub]
image: bootchart_500.png
---

One thing you need to know about me is that I am rarely satisfied.  For example, my laptop boots up in a very acceptable 25 seconds, but still I am looking for better.  So far I have not managed to improve matters, but I did find a great tool for graphing your boot performance, and a very neat way of adding it as a grub boot option, read the following article for how to set this up:

<!--more-->

## Analyse Boot Speed

### Step 1 - Install bootchart

    # aptitude install bootchart

### Step 2 - Update Grub

    # nano /boot/grub/menu.lst

Look for a line that looks like this:

    # altoptions=(single-user mode) single

And add a similar line after it that looks like this:

    # altoptions=(single-user mode) single
    # altoptions=(bootchart) init=/sbin/bootchartd

Then update your grub entries by typing:

    # update-grub

### Step 3 - Reboot

Reboot, making sure that you select the bootchart option from the grub menu.

Once the boot has finished, open a terminal and type:

    $ bootchart

### Step 4 - Analyse

You chould find a new png image in your current directory (the one you ran the bootchart command from) called bootchart.png.  Open it, analyse it and write a really good howto on how to optimise your system, and then publish it on the web!

Good luck!

