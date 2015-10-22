---
layout: post
title:  "64-bit Flash and Java Plugins"
date:   2008-11-20 00:00:00
categories: technology linux
tags: java flash icedtea adobe 
---

Following on from [my recent installation of 64-bit Debian Lenny on my new Toshiba laptop]({% post_url 2008-11-20-toshiba-satellite-pro-a300-debian-lenny-64-bit %}), I was horrified to learn that neither Flash nor Java exist for 64-bit Linux.  But after some digging it transpired that all was not lost.  Whilst Java is not available, the IcedTea project has reinvented the Sun Java Plugin.

    $ sudo aptitude install icedtea-gcjwebplugin

And it transpires that Adobe has launched an Alpha or pre-release version of Flash, and [supposedly it works well](http://blogs.computerworld.com/64_bit_linux_adobe_flash_player_surprisingly_good). To install simply visit:

   * [Adobe Labs: FlashPlayer 10 for 64-bit Linux](http://labs.adobe.com/technologies/flashplayer10/)

And download and extract the tar.gz file, then simply copy the `libflashplayer.so` file into `.mozilla/plugins` in your home directory (I had to create that directory).

YouTube (which I always consider to be a good test of both Java and Flash) worked perfectly.

So far 64-bit Linux has been remarkably painfree.

