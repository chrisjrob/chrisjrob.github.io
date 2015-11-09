---
layout: post
title: "LTSP | LTSP Update SSH Keys"
menu: ltsp
date: 2010-03-30 09:20:24
weight: 10
category: technology
tags: [ltsp, ssh]
---

## Command

    ltsp-update-sshkeys

## Introduction

Secure Shell Handler or SSH is a network protocol that allows data to be exchanged using a secure channel between two computers.  LTSP uses it to enable secure communication between clients and the Server.  SSH uses public-key cryptography to authenticate the client, this command rebuilds the keys.

You would run this command only at first install, or upon subsequent change of server IP addressing or DHCP or possibly hosts.  Basically if you get the "workstation not authorised" message, then you should run this command.

<!--more-->

## Man Page

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
        Peter Savage - silentk - cbx33 debug@silentkeystroke.co.uk

                                                                                                                                                                                                                    ltsp-update-kernels(8)
    juno:/var/lib/tftpboot/ltsp/i386# man ltsp-update-sshkeys
    ltsp-update-sshkeys(8)                                                                                                                                                                                           ltsp-update-sshkeys(8)

    NAME
        ltsp-update-sshkeys -- Updates the LTSP server's ssh host keys on the client

    SYNOPSIS
        ltsp-update-sshkeys

    DESCRIPTION
        ltsp-update-sshkeys updates the current ltsp servers sshkeys in the client chroot.  This is required for example if the ltsp server changes ip address.

    SEE ALSO
        ltsp-build-client(8), ltsp-update-kernels(8).

    AVAILABILITY
        ltsp-update-sshkeys is part of ltsp package and the latest versions are available in source form from https://launchpad.net/products/ltsp (link to URL https://launchpad.net/products/ltsp) .

    MAN PAGE AUTHOR
        Peter Savage
