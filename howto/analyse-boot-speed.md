---
layout: page
title: Howto | Analyse Boot Speed
menu: howto
weight: 40
---

<a href="/assets/bootchart.png"><img src="/assets/bootchart_500.png" class="image-right" alt="Boot Chart"></a>

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
