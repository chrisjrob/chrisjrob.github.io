---
layout: post
title:  "EeePC - Goodbye Xandros"
date:   2008-12-03 00:00:00
category: technology
tags: [linux, eeepc, debian]
---


<img src="/assets/eee-pc-701.jpg" class="image-right" alt="EEE PC 701">

When my old Dell laptop died, I naturally fell back to using my EeePC.  Now I've been using my EeePC for about six months now, and a very happy user I have been.  When I first bought it, I visited [eeeuser.com](http://wiki.eeeuser.com/howto:beginners_guide) to enable me to add icons to the easy mode interface, so that I could add openvpn and NoMachine NX for connecting to our LTSP server.  Once done I had an ideal machine for taking notes and doing occasional server admin from the shell, and even connect to our LTSP server via VPN.

<!--more-->

So now my old Dell laptop has died, and without warning my eeepc has been promoted to primary laptop.  So of course I wanted to bring it all up-to-date, I went into the upgrade option and saw that there were several upgrades waiting, which I duly installed.  This whole process felt scarily reminiscent of Windows Update... Sure enough my custom icons had all disappeared, but fortunately I had anticipated this and had taken a backup of the `simpleui.rc`.  But the problem went deeper than that, I found that Xandros had changed the whole file structure, and even when I found the new locations for the `simpleue.rc` file, my custom icons were simply ignored.

Some Googling "[eeepc lost icons](https://www.google.co.uk/search?q=eeepc%20lost%20icons)" found that I was not alone, but there was seemingly no fix for the problem (I think solutions have since been discovered).  In any case, I was by now feeling pretty fed up with such a non-standard system, so decided to leave Xandros and go to a standard Debian distro... more on this in due course.
