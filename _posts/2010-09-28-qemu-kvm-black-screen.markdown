---
layout: post
title:  "QEMU-KVM Black Screen"
date:   2010-09-28 00:00:03
category: technology
tags: [linux, debian, virtualisation]
---

I upgraded one of our servers yesterday, including an upgrade from the Debian Stable kvm72 package, to the Debian Backports qemu-kvm version 0.12.4, whereon I could no longer start our Windows Server 2003 virtual machine.  As soon as the machine started, it locked up completely with just a black screen, and had to be terminated with a kill -9 signal. 

After a considerable time spent googling without any success, I decided to upgrade the Kernel from 2.6.26 to the backports 2.6.32 and normal operation was restored.  I mention this only in the hope that the next person who googles qemu-kvm black screen might be saved a considerable time searching for the solution!
