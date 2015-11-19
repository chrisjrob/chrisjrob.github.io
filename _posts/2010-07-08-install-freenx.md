---
layout: post
title: Howto | Install FreeNX
menu: howto
date: 2010-07-08 16:01:27
weight: 40
category: technology
tags: [howto, linux, debian, nx]
---

## Introduction

Installing from Ubuntu onto Debian Lenny seems sub-optimal, but is quick and dirty.

## Step 1 - Add sources

    # deb http://ppa.launchpad.net/freenx-team/ppa/ubuntu intrepid main
    # deb-src http://ppa.launchpad.net/freenx-team/ppa/ubuntu intrepid main

<!--more-->

## Step 2 - Install FreeNX in Debian

    # aptitude update
    # aptitude install freenx

## Step 3 - Connecting

To connect, you need to download the NoMachine client.  If you have issues with the arrow/cursor keys, please see:

   * [Fix nxclient arrow keys]({% post_url 2010-07-08-fix-nxclient-arrow-keys %})

## References

   * [FreeNX](http://freenx.berlios.de/info.php)
   * [FreeNX on Debian Wiki](http://wiki.debian.org/freenx) &larr; Read this
   * [FreeNX on DebianHelp](http://www.debianhelp.co.uk/freenx.htm)
   * [FreeNX on LTSP](http://www.telemedia.ch/publ/ltsp-howto.html)
      * [FreeNX](http://www.telemedia.ch/publ/freenx-setup-howto.html)
   * [NoMachine](http://www.nomachine.com/)

