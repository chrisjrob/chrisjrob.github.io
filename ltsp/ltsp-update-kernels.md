---
layout: page
title: "LTSP | LTSP Update Kernels"
menu: ltsp
weight: 10
---

## ltsp-update-kernels

### Introduction

The ltsp-update-kernels script copies it into the chroot environment and automatically updates the symlinks for the boot loader in the process.

ltsp-update-kernels updates the current client kernel by using the current kernel from the chroot and copying it to the tftpboot directory (`/var/lib/tftpboot/ltsp/i386/`).  It also copies the initramfs across and sets up the PXE linux boot files.

This command must be run each time the kernel changes in the chroot.  There should be no harm in running this command each time you update the chroot, just in case.

### Man Page

You should see the man page appropriate for your system, but the Debian Lenny man page current states:

    ltsp-update-kernels(8)

    NAME
        ltsp-update-kernels -- Updates the LTSP server kernel

    SYNOPSIS
        ltsp-update-kernels

    DESCRIPTION
        ltsp-update-kernels  updates  the current ltsp client kernel by using the current kernel from the ltsp chroot and copying it to the tftpboot directory.  It also copies the initramfs across and sets up the PXE linux or Yaboot
        (PPC) boot files, depending on the arch of the system.

    SEE ALSO
        ltsp-build-client(8), ltsp-update-sshkeys(8).

    AVAILABILITY
        ltsp-update-kernels is part of ltsp package and the latest versions are available in source form from https://launchpad.net/products/ltsp (link to URL https://launchpad.net/products/ltsp) .

    MAN PAGE AUTHOR
        Peter Savage
