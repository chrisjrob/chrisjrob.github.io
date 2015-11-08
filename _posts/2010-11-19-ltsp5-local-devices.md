---
layout: post
title: "LTSP | LTSP5 Local Devices"
menu: ltsp
date: 2010-11-19 15:04:50
weight: 10
category: technology
tags: [ltsp]
---

## Introduction

You've inserted a disk or memory stick in your thin client, and nothing happened, what next?

## Check lts.conf

Each user you wish to be able to access their local devices needs LOCALDEV = True in lts.conf, alternatively you may add to the '[default]' section to make this global.

    [192.168.1.198]
    # Joe Bloggs Desktop
        LOCALDEV             = True

<!--more-->

## Check user is in fuse group

    # groups userid
    userid satff users audio fuse

If they are not in the fuse group then:

    # adduser userid fuse

## Check lts.conf settings are reaching client

A simple typo can mean that your carefully crafted lts.conf file is not reaching its target audience.  To test, boot up the thin client and ctrl+alt+f1 to get to the console, login as root and type the following:

See LTSP Client Root Password if you are unable to log into the client.

    # getltscfg -a

This will give you a list of all the settings that apply to this particular client, including any default settings.  You need to check that you can see the above LOCALDEV="True" is visible.

## Check logs on client

    # tail -f /var/log/syslog

Then try inserting the device, and you should see the detection - look for errors that might indicate what has gone wrong.

## Check UDEV can see drive

Still on the client:

    # udevadm info -q all -n sda1

Replace sda1 with the required device, e.g. sr0 for a cdrom etc.

    P: /block/sda/sda1
    N: sda1
    S: block/8:1
    S: disk/by-id/usb-USB_DISK_2.0_J68J5KQHN7TQ0H7G-0:0-part1
    S: disk/by-path/pci-0000:00:1d.7-usb-0:2:1.0-scsi-0:0:0:0-part1
    S: disk/by-uuid/99B8-E4E6
    S: disk/by-label/PKBACK#\x20001
    E: ID_VENDOR=USB
    E: ID_MODEL=DISK_2.0
    E: ID_REVISION=1219
    E: ID_SERIAL=USB_DISK_2.0_J68J5KQHN7TQ0H7G-0:0
    E: ID_SERIAL_SHORT=J68J5KQHN7TQ0H7G
    E: ID_TYPE=disk
    E: ID_INSTANCE=0:0
    E: ID_BUS=usb
    E: ID_PATH=pci-0000:00:1d.7-usb-0:2:1.0-scsi-0:0:0:0
    E: ID_FS_USAGE=filesystem
    E: ID_FS_TYPE=vfat
    E: ID_FS_VERSION=FAT16
    E: ID_FS_UUID=99B8-E4E6
    E: ID_FS_UUID_ENC=99B8-E4E6
    E: ID_FS_LABEL=PKBACK# 001
    E: ID_FS_LABEL_ENC=PKBACK#\x20001
    E: ID_FS_LABEL_SAFE=PKBACK#_001

An example of a CDROM:

    P: /block/sr0
    N: sr0
    S: block/11:0
    S: scd0
    S: disk/by-path/pci-0000:00:1f.2-scsi-1:0:0:0
    S: cdrom
    S: cdrw
    S: dvd
    S: dvdrw
    E: ID_CDROM=1
    E: ID_CDROM_CD_R=1
    E: ID_CDROM_CD_RW=1
    E: ID_CDROM_DVD=1
    E: ID_CDROM_DVD_R=1
    E: ID_CDROM_DVD_RW=1
    E: ID_CDROM_DVD_RAM=1
    E: ID_CDROM_DVD_PLUS_R=1
    E: ID_CDROM_DVD_PLUS_RW=1
    E: ID_CDROM_DVD_PLUS_R_DL=1
    E: ID_CDROM_MRW=1
    E: ID_CDROM_MRW_W=1
    E: ID_PATH=pci-0000:00:1f.2-scsi-1:0:0:0

## Check ltspfs is installed on the server

    # dpkg -l ltspfs | grep ^ii
    ii  ltspfs                                       0.6-1~bpo50+1                        Fuse based remote filesystem for LTSP thin clients

## Check fuse is running

    # lsmod | grep fuse
    fuse                   47124  3 

If fuse is not running, then:

    # echo fuse >> /etc/modules
    # modprobe fuse
    # adduser USER fuse

## KDE Desktop Icons

   * [Local Device Icons on KDE Desktop]({% post_url 2009-03-21-ltsp-local-device-icons-on-kde-desktop %})

## References

For some additional troubleshooting, try: http://wiki.ubuntu.com/DebugLocalDev

