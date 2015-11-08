---
layout: post
title: Howto | Install Flashplayer
menu: howto
date: 2009-03-21 06:01:08
weight: 40
category: technology
tags: [howto, linux, debian, flashplayer]
---

## Install Flashplayer on Debian Etch

You should be able to install from Backports:

    $ apt-get -t "etch-backports" install flashplugin-nonfree

If this fails, then leave it installed and manually download from Adobe:

   * http://www.adobe.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash&P2_Platform=Linux

Then extract contents and copy `libflashplayer.so` into `/usr/lib/flashplugin-nonfree/`. The failed install should have created all the necessary symlinks.

