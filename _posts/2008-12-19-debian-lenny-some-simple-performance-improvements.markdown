---
layout: post
title:  "Debian Lenny - Some simple performance improvements"
date:   2008-12-19 00:00:00
category: technology
tags: [linux, debian, lenny]
---

After setting up my Eee PC on Debian and following the tips (see [Lenny on Speed]({% post_url 2008-12-08-lenny-on-speed %}) to maximise performance, I have found the same tips quite effective on other Debian systems.  The key changes are as follows:

<!--more-->

## Add a ramdisk file system for /tmp

    /etc/fstab:
    tmpfs      /tmp     tmpfs      defaults     0    0

## Add a ramdisk file system for /var/run and /var/lock

    /etc/default/rcS:
    RAMRUN=yes
    RAMLOCK=yes

## Add relatime option to hard disk file systems

Lastly, in `/etc/fstab`, add the following option to each hard disk based filesystem "relatime".  This is really important, as this stops the system from recording when a file was last read; without this option set, every time a file is read on your system, it is written to with the date last read - effectively changing a read into a read/write and thus slowing down the system.  Adding the relatime option cuts this nonsense out and makes a surprising performance improvement.

    # /etc/fstab: static file system information.
    #
    # <file system> <mount point>   <type>  <options>                   <dump>  <pass>
    proc            /proc           proc    defaults                      0       0
    /dev/sda1       /               ext3    errors=remount-ro,relatime    0       1
    /dev/sda6       /home           ext3    defaults,relatime             0       2
    /dev/sda5       none            swap    sw                            0       0
    /dev/scd0       /media/cdrom0   udf,iso9660 user,noauto               0       0
    /dev/fd0        /media/floppy0  auto    rw,user,noauto                0       0
    tmpfs           /tmp            tmpfs   defaults                      0       0

## Using a faster system shell

By default, the standard system shell `/bin/sh` is provided by bash. Bash is very slow at start-up, because it does quite a lot of things before it starts to process shell statements. During boot-up, a lot of shell scripts are executed, and switching to a quicker shell has a noticeable impact. To switch `/bin/sh` to point at dash, install the package and use `dpkg-reconfigure` to enable it as the default system shell.

    $ aptitude install dash
    $ dpkg-reconfigure dash

Thanks to [Debian Wiki](http://wiki.debian.org/) for these tips.
