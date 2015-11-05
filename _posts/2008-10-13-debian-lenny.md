---
layout: post
title:  "Debian Lenny"
date:   2008-10-13 00:00:00
category: technology
tags: [linux, debian]
---

Some weeks ago the hard drive on my work PC failed, with a temperature error on the hard drive.  I swapped the drive out but then had to decide which distro to install.  I had started my Linux life with [Kubuntu](http://www.kubuntu.org/), experimented with [Debian Sid](https://www.debian.org/releases/sid/) + [Experimental](https://wiki.debian.org/DebianExperimental), before returning to Kubuntu.  Given [Debian Lenny](https://www.debian.org/releases/lenny/)'s imminent release, the logical progression was to try that.

<!--more-->

I downloaded the ISO using Jigdo (see [How to Download Debian with Jigdo](/howto/download-debian-with-jigdo/)) and ran the installer.  It really was simplicity itself and, except for the lack of a live CD, the installation was at least as simple and maybe simpler than Kubuntu.  In particular I love the fact that the partitioner gives you intelligent options, rather than the Kubuntu installer's all-or-nothing approach.  

Having installed Debian Lenny, I was struck by just how like Kubuntu it is, hardly surprising given the Debian parentage of Kubuntu.  What was surprising though, was just how easy everything was - I simply added non-free and contrib to the repositories, installed Java, Flash, the Win32 Codecs, and the MS Fonts.  To improve its looks I simply did:

    $ sudo apt-get install kwin-style-crystal kde-icons-nuvola

And then I activated Crystal style and the Nuvola icons in the KDE Control Panel.  The Crystal style takes a little bit of tweaking to make it look like Kubuntu (if that's what you like).  To complete the effect I also installed Compiz, and Openbox, so that I have a choice of three Windows Managers - Slow, Medium and Fast!

