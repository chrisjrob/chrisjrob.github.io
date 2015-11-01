---
layout: page
title: "LTSP | LTSP Client Upgrade"
menu: ltsp
weight: 10
---

## LTSP Client Upgrade

### Warning

All the following commands are entered on the server.  Normally this would be having logged into your normal LTSP desktop and opened a terminal session, but it could equally be from an ssh session to the server.  The key thing is that you do not run these commands from a client shell, as the client system is read-only.

These instructions are for Debian, Ubuntu users will also need to update the client image afterwards.  

### Step by Step Process

    $ sudo chroot /opt/ltsp/i386
    # mount -t proc /proc /proc
    # mount -t sysfs sys /sys
    # apt-get update
    # apt-get upgrade
    # umount sys
    # umount /proc
    # exit
    $ sudo ltsp-update-kernels

The mount proc and mount sysfs commands are not always required, and can be omitted in many instances, but if in doubt I don't believe they cause any harm.

The [ltsp-update-kernels](/ltsp/ltsp-update-kernels/) command is only required if the client kernel has been upgraded, but again I don't believe it causes any harm to run it unnecessarily.

