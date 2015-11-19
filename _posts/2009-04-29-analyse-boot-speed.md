---
layout: post
title: Howto &#124; Analyse Boot Speed
menu: howto
date: 2009-04-29 19:45:16
weight: 40
category: technology
tags: [howto, linux, cli, bootchart, grub]
image: bootchart.png
---

## Step 1 - Install bootchart

    # aptitude install bootchart

## Step 2 - Update Grub

    # nano /boot/grub/menu.lst

<!--more-->

Look for a line that looks like this:

    # altoptions=(single-user mode) single

And add a similar line after it that looks like this:

    # altoptions=(single-user mode) single
    # altoptions=(bootchart) init=/sbin/bootchartd

Then update your grub entries by typing:

    # update-grub

## Step 3 - Reboot

Reboot, making sure that you select the bootchart option from the grub menu.

Once the boot has finished, open a terminal and type:

    $ bootchart

## Step 4 - Analyse

You chould find a new png image in your current directory (the one you ran the bootchart command from) called bootchart.png.  Open it, analyse it and write a really good howto on how to optimise your system, and then publish it on the web!

Good luck!

