---
layout: post
title: Howto &#124; Create a Virtual Machine in KVM
menu: howto
date: 2009-04-09 19:26:35
weight: 40
category: technology
tags: [linux, howto, virtualisation]
---

## Creating a disk image for the guest

The following command will create a resizing 10G image in your current directory:

    # /usr/bin/qemu-img create -f qcow2 vdisk.img 10G

<!--more-->

## Booting from CDROM

I struggled on our LTSP server to boot from CDROM, but found that I could boot easily from the downloaded IMG files (from Microsoft).

Boot from first CD image:

    $ kvm -no-acpi -m 512 -cdrom /home/username/vdisks/w2k3/iso/X13-04874.img -boot d -hda w2k3.img -k en-gb -smp 2

Boot from second CD image:

    $ kvm -no-acpi -m 512 -cdrom /home/username/vdisks/w2k3/iso/X13-04795.img -boot d -hda w2k3.img -k en-gb -smp 2

## References

   * http://kvm.qumranet.com/kvmwiki/HOWTO
   * http://www.debian-administration.org/articles/545

