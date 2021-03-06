---
layout: post
title:  "Howto | Download Debian with Jigdo"
menu: howto
weight: 40
date: 2009-03-21 05:59:30
category: technology
tags: [howto, linux, debian, jigdo]
image: debian_logo.png
---

Just do an `sudo apt-get jigdo-file` and read the following:

   * [Debian Jigdo]

<!--more-->

## Where to get downloads

Download the appropriate .jigdo and .template file into a suitable directory on your system.

   * [Jigdo Releases]

## Reducing your download

Pretty much the raison-d'etre of Jigdo is the ability to re-use an existing CD to reduce the number of files to be downloaded.  But if you're anything like me it's much easier to use an ISO:

    $ sudo mkdir /mnt/cdrom
    $ sudo mount -o loop debian-LennyBeta2-i386-kde-CD-1.iso /mnt/cdrom

Now just enter `/mnt/cdrom` as the path to the CD to use

## References

   * [Debian Jigdo] 
   * [How to use Jigdo Lite](http://www.electrictoolbox.com/how-to-use-jigdo-lite/)


[Debian Jigdo]: http://tldp.org/HOWTO/Debian-Jigdo/index.html
[Jigdo Releases]: http://www.debian.org/CD/jigdo-cd/
