---
layout: post
title: Howto | Install Samba to Access Windows Shares
menu: howto
date: 2009-03-21 06:15:07
weight: 40
category: technology
tags: [howto, linux, samba, ldap]
---

## Warning

**If you are looking for a full Samba LDAP installation, please look elsewhere, this is a simple set-up to access files from an existing Windows or Samba server.**

## Installation

    # apt-get install smbfs smbclient

<!--more-->

## Create password file

    $ echo "username=abc" >> /home/username/.smbpassword
    $ echo "password=p455w0rd" >> /home/username/.smbpassword
    $ chmod go-rwx /home/username/.smbpassword

## Add network drives

Edit /etc/fstab:

    # /etc/fstab: static file system information.
    #
    # <file system> <mount point>      <type>      <options>                    <dump>  <pass>
    proc            /proc              proc        defaults                     0       0
    /dev/sda1       /                  ext3        defaults,errors=remount-ro   0       1
    /dev/sda5       none               swap        sw                           0       0
    /dev/scd0       /media/cdrom0      udf,iso9660 user,noauto                  0       0
    //hostname/D$   /media/shared      cifs        auto,rw,uid=trident,gid=users,fmask=0664,dmask=0775,iocharset=iso8859-15,credentials=/home/user/.smbpassword 0 0

Having done this, I find that you have to issue a:

    $ sudo mount -a

This simply remounts any unmounted filesystems from /etc/fstab.

## Mount directly

    $ sudo mount -t cifs //hostname/D$ /media/drive_d -o username=..,password=...,auto,rw,uid=...,gid=...,file_mode=0664,dir_mode=0775,iocharset=iso8859-15
    $ sudo mount -t cifs //hostname/D$ /media/drive_d -o auto,rw,uid=...,file_mode=0664,dir_mode=0775,iocharset=iso8859-15,credentials=/home/user/.smbpasswd
    $ sudo umount /media/drive_d

## Unmount

You unmount by referencing the mount point.

    $ sudo umount /media/drive_d

## OpenOffice

There is a bug in OpenOffice which prevents you from being able to open documents by clicking on the file from within a Samba share. To fix this replace the default %U switch with %f in the KDE Menu configuration editor - right click over the KDE start menu &rarr; Menu Editor; next find every occurrence of the OO suite and replace %U with %f. 

## References

   * http://www.justlinux.com/nhf/Filesystems/Mounting_smbfs_Shares_Permanently.html
   * http://www.linuxquestions.org/questions/linux-newbie-8/mounting-an-smbfs-using-fstab-461202/
