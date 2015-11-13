---
layout: post
title:  "Lenny on Speed"
date:   2008-12-08 00:00:00
category: technology
tags: [linux, toshiba, debian, eeepc]
image: debian_logo.png
---

<img src="/assets/debian_logo.png" class="image-right" alt="Debian logo">

Okay, to be quite honest my Debian Lenny 64-bit Toshiba Satellite Pro A300 laptop is really fast.  Certainly the fastest machine that I've ever used, problem is that makes you hungry for more speed.  So far I have followed several of the suggestions included in this [Debian EeePC page](http://wiki.debian.org/DebianEeePC/TipsAndTricks), for example adding the `relatime` option to the disks.

<!--more-->

I've also switched on boot concurrency and installed `preload`, as discussed in [this forum thread](http://forums.debian.net/viewtopic.php?t=31275).  Early days, but it does feel very snappy indeed.  The bootup doesn't seem much faster, although apparently preload can slow things up a tad, but it is still around one minute, including about 5 seconds for the bios and another 15 seconds for typing in the kdm and kwalletmanager passwords.

I've also moved the `unmountnfs.sh` from the shutdown scripts to position 14, to enable this to be completed before closing the network services.  This has dramatically improved the shutdown performance.

Follow these links for more information:

   * [Debian EeePC Tips & Tricks](http://wiki.debian.org/DebianEeePC/TipsAndTricks)
   * [Debian Forum Topic](http://forums.debian.net/viewtopic.php?t=31275)

Lastly, exim4 is installed by default, but you really don't need this if, like me, you send/receive mail through a dedicated server, this shaves a second or two from the boot process.
