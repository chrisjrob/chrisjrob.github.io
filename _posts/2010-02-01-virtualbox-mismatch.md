---
layout: post
title: Howto | VirtualBox Mismatch
menu: howto
date: 2010-02-01 09:45:53
weight: 40
category: technology
tags: [linux, howto, virtualisation]
---

I have been told that installing package `virtualbox-ose-dkms` solves all these problems.  I have installed and it reported that my modules were up-to-date, which is promising.  I shall try and remember to update this page later, but I thought I'd write this now in case I forget!!

## Solving VirtualBox Mismatch

<!--more-->

If you install `virtualbox-ose` under Debian, along with `virtualbox-ose-modules-2.6`, there can be a mismatch between versions, which will prevent VirtualBox from running.  At the time of writing `virtualbox-ose` is at version 1.66 and `virtualbox-ose-modules-2.6` is at 1.62.

Unfortunately you need to build the kernel module yourself.

### Step 1: Determine modules package name

    $ dpkg -l "virtualbox-ose-modules*" | grep ii
    ii  virtualbox-ose-modules-2.6.30-2-amd64 3.0.12-dfsg-1+2.6.30-8squeeze1 VirtualBox modules for Linux (kernel 2.6.30-

Take a note of this package name for the next step.

### Step 2: Uninstall the Debian package

    $ sudo apt-get remove virtualbox-ose-modules-2.6.30-2-amd64

### Step 3: Install VirtualBox Source

    $ sudo apt-get install virtualbox-ose-source
    $ sudo module-assistant auto-install virtualbox-ose

This will produce a custom `virtualbox-ose-modules` package in `/usr/src`, which will then be used to install.

**Look out for error messages, if it states that a deb file already exists, remove it and try again.**

### Step 4: Load Kernel Driver

**This step was carried out automatically in the version that I have.**

    $ sudo modprobe -r vboxdrv
    $ sudo modprobe vboxdrv

