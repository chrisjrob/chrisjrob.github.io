---
layout: post
title: "LTSP | LTSP Update Kernels"
menu: ltsp
date: 2010-03-30 09:21:30
weight: 10
category: technology
tags: [ltsp]
image: ltsp_logo.png
---

## Command

    ltsp-update-kernels

## Introduction

The ltsp-update-kernels script copies it into the chroot environment and automatically updates the symlinks for the boot loader in the process.

<!--more-->

ltsp-update-kernels updates the current client kernel by using the current kernel from the chroot and copying it to the tftpboot directory (`/var/lib/tftpboot/ltsp/i386/`).  It also copies the initramfs across and sets up the PXE linux boot files.

This command must be run each time the kernel changes in the chroot.  There should be no harm in running this command each time you update the chroot, just in case.

