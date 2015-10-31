---
layout: page
title: "LTSP | LTSP5 Disable Floppy"
menu: ltsp
weight: 10
---

## LTSP5 Disable Floppy

Local floppy drives do not seem to work well under LTSP, in any case they are obsolete technology.  This page describes how to disable under LTSP5.

Find and edit the following file and comment out the legacy floppy drive command:

    $ sudo nano /opt/ltsp/i386/etc/udev/ltspfsd.rules

    ----------------------------------
    Extract from /opt/ltsp/i386/etc/udev/ltspfsd.rules:

    # legacy floppy drives:
    #ACTION=="add", KERNEL=="fd[0-9]", RUN+="ltspfs_entry add %k auto"
    ^
    ----------------------------------

    # exit
    $ sudo ltsp-update-image
