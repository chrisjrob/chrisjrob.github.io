---
layout: post
title: Linux | Windows Virtualisation
menu: linux
date: 2009-03-21 05:31:50
weight: 40
category: technology
tags: [linux, windows, virtualisation]
---

The area of virtualisation is one of rapid development and you should investigate more widely before making any decisions.

## Options for Windows Virtualisation

There are several options for Windows virtualisation, including:

   * [QEMU](#qemu)
   * [Xen](#xen)
   * [VirtualBox](#virtualbox)
   * [VMWare Server](#vmware-server)

<!--more-->

### QEMU

A true open source virtualisation product, but one that runs slowly, often too slowly to be of use. Fortunately you can optimise QEMU by the installation of one of the following:

   * KQEMU
   * KVM

The former is not entirely open source, but is your main option if you have a Kernel less than 2.6.20.

### XEN

Is not an open source product, but is available free. It is considered to be very quick.

### VirtualBox

InnoTek offer two versions of their VirtualBox product:

   * *Full Product* - free for Personal and reasonable Evaluation
   * *OSE (Open Source Edition)* - free but requires compiling from source and comes without Guest Additions and without Headless VRDP. The latter seems unimportant, given that Windows has an RDP server already, but it is the only way of running VirtualBox headlessly AFAIK.

I have tested on Debian with great success and the following are the links I used:

   * [Build VirtualBox](https://help.ubuntu.com/community/VirtualBox#head-ac88c03223e773c78dbb46b4b13c109de1143a03)
   * [Complete Host Networking](http://ubuntuforums.org/archive/index.php/t-346185.html)
   * [Install SeamlessRDP](http://www.cendio.com/seamlessrdp/)
   * [Configure for seamless and headless operation](http://ubuntuforums.org/showthread.php?t=433359)
   * [Fix for multiple windows](http://ubuntuforums.org/showthread.php?t=433359&page=11)
      * http://ubuntuforums.org/showthread.php?t=224212
      * https://www.fontis.com.au/rdesktop
   * [VirtualBox Manual](http://www.virtualbox.org/download/UserManual.pdf)
   * [Concurrent Users](http://sig9.com/articles/concurrent-remote-desktop)
      * http://concurrentremotesessions.netfirms.com/
      * http://sala.pri.ee/terminal-server-patch/

### VMWare Server

Free but not open source. Requires compiling from source. Excellent reliability, supported product. The author has not tested this product.
