---
layout: post
title:  "Solved PXE Booting the Viglen MPC-L"
date:   2008-08-28 00:00:00
categories: technology linux ltsp
tags: viglen xubuntu xfce
---

I have solved the [issue with PXE booting on the Viglen MPC-L]({% post_url 2008-08-28-pxe-booting-the-viglen-mpc-l %})!

To get past the kernel panic, it was necessary to switch of acpi in the kernel.  In LTSP that means copying the following file:

N.B. Replace 00-00-00-00-00-00 with the MAC address of the Viglen but note it has to have the leading 01 at the beginning

    # cp /var/lib/tftpboot/ltsp/i386/pxelinux.cfg/default /var/lib/tftpboot/ltsp/i386/pxelinux.cfg/01-00-00-00-00-00-00

Then edit the file and add `acpi=off` to the end of the line (I also added `pnpbios=off` to reduce the boot-up error messages):

    DEFAULT vmlinuz ro initrd=initrd.img quiet root=/dev/nfs ip=dhcp boot=nfs acpi=off pnpbios=off

And it now boots up fine.
