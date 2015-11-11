---
layout: post
title: Howto | Install KeePassX on Debian Etch
menu: howto
date: 2009-03-21 06:03:30
weight: 40
category: technology
tags: [howto, linux, keepassx, debian]
---

<img src="/assets/debian_logo.png" class="image-right" alt="Debian logo">

## Introduction

KeePassX cannot be installed on Debian Etch, because of some dependency issues:

    Version: 0.3.1-1
    Depends: libc6 (>= 2.7-1), libgcc1 (>= 1:4.1.1-21), libqt4-core (>= 4.3.4), libqt4-gui (>= 4.3.4), libstdc++6 (>= 4.2.1-4), libx11-6, libxtst6

<!--more-->

## Solution

Install from source.  These instructions were borrowed from the following comment (thank you "John"):

   * http://www.keepassx.org/howto/setup/inst_source_tar#comment-15355

### Install recent version of qt4

I installed from lenny, which is not ideal.  The above instructions do not say to do this, but I had already done it to resolve stability problems (see Install italc notes).

    $ sudo apt-get install qt4-dev qt4-dev-tools qt4-designer

### Install Source Repositories

You may need to add the lenny source repositories to `/etc/apt/sources.list`:

    deb-src http://ftp.uk.debian.org/debian/ lenny main non-free contrib

### Download Source

    $ cd
    $ mkdir keepassx
    $ cd keepassx
    $ apt-get source keepassx

### Make

    $ cd keepass*
    $ qmake-qt4
    Project MESSAGE: See 'INSTALL' for configuration options.
    Project MESSAGE: Install Prefix: /usr
    Project MESSAGE: *** Makefile successfully generated.
    Project MESSAGE: *** Start make now.
    $ make

**If you downloaded the source from [KeePassX](http://www.keepassx.org/) itself, then you will probably need to cd into the src directory, delete the Makefile that was created and run qmake-qt4 again from there (ie: qmake-qt4; cd src; rm Makefile ; qmake-qt4 ; cd ..**

### Errors

If the above still gives an error about libXtst (and mind didn't), you can either fix the source code, or simply:

    $ sudo ln -s /usr/lib/libXtst.so.6 /usr/lib/libXtst.so
    $ make

**This section has not been tested by the author**

### Install

    $ sudo make install

### Test

You should see it installed under your Utilities menu, but you may need to log off/on for this to appear.  Alternatively I usually find editing the menu and resaving has the same effect.

## References

   * [KeePassX](http://www.keepassx.org/)
      * [Forum post detailing install method](http://www.keepassx.org/howto/setup/inst_source_tar#comment-15355)
