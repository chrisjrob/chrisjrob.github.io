---
layout: post
title: Howto | Install KVM
menu: howto
date: 2009-03-21 05:32:12
weight: 40
category: technology
tags: [howto, linux, virtualisation]
---

## Check CPU supports KVM

    # egrep '^flags.*(vmx|svm)' /proc/cpuinfo 

If nothing is displayed, then you do not have a CPU that supports KVM. If lines are output that include the text "vmx" then you have an Intel CPU that supports KVM, if "svm" then an AMD CPU that supports KVM.

<!--more-->

## Check Kernel

In order to run KVM you must be running 2.6.20 or higher. You can check this by running the following command:

    # uname -r
    2.6.26-1-686

## Install Prerequisites

    # aptitude install gcc-3.4 libsdl1.2-dev zlib1g-dev libasound2-dev linux-kernel-headers pkg-config libgnutls-dev

## Install KVM

**Make sure that you have Backports installed if you are running Etch.**

    # aptitude install kvm qemu

**You need QEMU in order to create disk images.**

## Add User to KVM

    # adduser $USER kvm

## Load KVM Modules

Decide whether you have an Intel or AMD CPU (see Step 1).

    # modprobe kvm
    # modprobe kvm-intel or kvm-amd (depending on CPU type)

If this fails then try

    # dmesg | grep kvm

If it states "kvm disabled in BIOS" then you will need to boot into the BIOS and switch on VT support (probably under advanced processor options).

You can check that the modules are enabled by running:

    # lsmod | grep kvm

## Set KVM modules to autoload

Add the modules to /etc/modules to ensure that they load upon the next reboot.

    # echo "kvm" >> /etc/modules
    # echo "kvm-intel" >> /etc/modules

## References

   * [KVM Wiki Howto](http://kvm.qumranet.com/kvmwiki/HOWTO)
   * [KVM on Debian Wiki](http://wiki.debian.org/KVM)
