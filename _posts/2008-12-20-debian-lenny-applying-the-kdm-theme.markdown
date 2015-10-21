---
layout: post
title:  "Debian Lenny - applying the new kdm theme"
date:   2008-12-20 00:00:00
categories: technology floss linux debian
tags: lenny kde kdm theme
---

If you install kde from a Debian base install, then it is likely that you do not have the attractive new Debian theming for the boot loader and KDM login.  The key to this is the installation of desktop-base, but you do need a few other packages, which don't currently get treated as dependencies.

## Install packages

    $ sudo aptitude install desktop-base ksplash-engine-moodin kdmtheme splashy splashy-themes

## Add splashy to grub

Look for the kopt line in /boot/grub/menu.lst and add "quiet splash vga=791":

N.B.  vga=791 is suitable for 1024x768, if your monitor resolution is below this, then you should change this number by reference to the table below.

    /boot/grub/menu.lst:
    # kopt=root=/dev/sda1 ro quiet splash vga=791

N.B. Do not uncomment this line, this line is not used itself, but is used by update-grub to automatically populate the actual kernel lines further down

Then update-grub to apply this change to your kernels:

    $ sudo update-grub

## Splashy VGA settings table

| colour | depth | 640x480 | 800x600 | 1024x768 | 1280x1024 |
|--------+-------+---------+---------+----------+-----------|
| 256    | 8bit  | 769     | 771     | 773      | 775       |
| 32000  | 15bit | 784     | 787     | 790      | 793       |
| 65000  | 16bit | 785     | 788     | 791      | 794       |
| 16.7m  | 24bit | 786     | 789     | 792      | 795       |

The 65000 colour line is the one recommended for this purpose, so you'll probably want 785 or 788 if you have a low resolution netbook.  I don't believe there is any point in increasing to 794, as I believe the new Debian themes have been designed for 1024x768 (I have not checked that fact).

## Configure KDM themes

Under KDE Control Panel, System Administration, KDM Theme Manager, enter Administrator Mode and enable KDM Themes and select "More Blue Orbit".  It will warn you that your changes will be overwritten by /etc/default/kdm.d/, but this step still seems to be required.

## Remove Login Manager Background

Under KDE Control Panel, System Administration, Login Manager, select the Background tab and disable the background.  This background displays after your new KDM Theme and before your actual desktop, which is definitely one background too many!
