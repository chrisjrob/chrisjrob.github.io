---
layout: post
title: "LTSP | LTSP Update Image"
menu: ltsp
date: 2010-03-30 09:21:11
weight: 10
category: technology
tags: [ltsp]
---

<img src="/assets/ltsp_logo.png" class="image-right" alt="LTSP Logo">

## Command

    ltsp-update-image

## Comment

For systems that use NBD (not Debian), this command will create a client image from the contents of `/opt/ltsp/i386`, and store it in `/opt/ltsp/i386/images`.

Any change you make in the chroot will only take effect for the clients after you run ltsp-update-image.  As such, this is the command that you will run most often.

<!--more-->

As Debian uses NFS, this command is not necessary, unless you have chosen to change to NBD, in which case you presumably know that you are "different".

If you are on Debian and you have a directory `/opt/ltsp/i386/images`, then this is likely to mean that you have run this command by mistake.  This may trigger the clients to attempt to use NBD, so you should probably remove this directory, or explicitly tell your clients to use NFS - see LTSP5 Troubleshooting for details.

