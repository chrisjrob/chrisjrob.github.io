--- 
layout: post 
title: Kubuntu Lucid Lynx 10.04 Nvidia Installation
date: 2011-03-04
type: post 
published: true 
status: publish
categories: technology linux mythtv
tags: kubuntu mythbuntu nvidia
---

After updating my Kubuntu Mythbuntu Home Theatre PC, it
failed to boot into KDE, leaving me instead at a text login.  Fixing the
problem was not difficult, but I actually had problems finding the
correct instructions, and all the instructions that I did find left out
a crucial step.  I thought I would write up what I did largely for my
own benefit:

<!--more-->

Firstly, I tried to load the nvidia module:

    NVIDIA: Failed to load the NVIDIA kernel module. Please check your
    system's kernel log for additional error messages.
    Failed to load module  "nvidia"

Clearly the correct nvidia driver for this kernel is missing.  If it was
working and an update has messed it up for you, then possibly you have
had a kernel update and don't have the correct kernel headers installed.
 The kernel headers are needed by dkms to rebuild the nvidia module.  If
you're lucky, you may just be able to install the Linux kernel headers
and reboot:

    $ sudo apt-get install linux-headers-`uname -r`
    $ sudo shutdown -r now

With luck dkms will have rebuilt the nvidia module and all will be well.
 If it hasn't worked, then we need to take more dramatic action.  Let's
start with an nvidia-free zone:

    $ sudo apt-get purge nvidia*

Next we should ensure that the nouveau module is blacklisted, so that we
do not end up fighting the open source nouveau driver:

    $ sudo vim /etc/modprobe.d/blacklist.conf
    blacklist nouveau
    blacklist vga16fb

Now we can install the latest nvidia modules:

    $ sudo apt-get install nvidia-current nvidia-settings nvidia-kernel-common

And run the nvidia configurator:

    $ sudo nvidia-xconfig

Finally reboot, and in theory the nvidia module should be rebuilt by
dkms:

    $ sudo shutdown -r now

After the reboot, it may be all working, but we can check that the
nvidia module has been loaded:

    $ lsmod | grep nvidia
    nvidia 10832442 28

If this returns nothing, then it has not worked, if it returns "nvidia"
as above, then you should have a working system.

