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

## Man Page

You should see the man page appropriate for your system, but the Debian Lenny man page current states:

    ltsp-update-image(8)

    NAME
        ltsp-update-image -- Updates the LTSP server image to be shared by nbd

    SYNOPSIS
        ltsp-update-image

    DESCRIPTION
        ltsp-update-image updates the current ltsp client chroot image by using squashfs to create a compressed image of the chroot in /opt/ltsp/arch.  This can then be shared out by nbdrootd(8).

    OPTIONS
        -p --port Port you wish this nbd image to communicate on.  Default is 2000.

        -b --base Base of ltsp chroot.  Default is /opt/ltsp if unspecified.

        -a --arch Architecture of this image.  Default is arch of the host.

        -h --help The applications help page.

    SEE ALSO
        ltsp-build-client(8), ltsp-build-kernels(8), ltsp-update-sshkeys(8), nbdrootd(8).

    AVAILABILITY
        ltsp-update-kernels is part of ltsp package and the latest versions are available in source form from https://launchpad.net/products/ltsp (link to URL https://launchpad.net/products/ltsp) .

    MAN PAGE AUTHOR
        Scott Balneaves