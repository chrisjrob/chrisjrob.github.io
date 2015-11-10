---
layout: post
title: "LTSP | LTSP5 Disable Floppy"
menu: ltsp
date: 2009-02-17 17:04:58
weight: 10
category: technology
tags: [ltsp]
---

<img src="/assets/ltsp_logo.png" class="image-right" alt="LTSP">

Local floppy drives do not seem to work well under LTSP, in any case they are obsolete technology.  This page describes how to disable under LTSP5.

Find and edit the following file and comment out the legacy floppy drive command:

<!--more-->

    Extract from /opt/ltsp/i386/etc/udev/ltspfsd.rules:

    # legacy floppy drives:
    #ACTION=="add", KERNEL=="fd[0-9]", RUN+="ltspfs_entry add %k auto"
    ^
    ----------------------------------

    # exit
    $ sudo ltsp-update-image
