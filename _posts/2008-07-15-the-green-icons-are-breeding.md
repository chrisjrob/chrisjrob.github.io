---
layout: post
title:  "The Green Icons are breeding"
date:   2008-07-15 00:00:00
category: technology
tags: [linux, ltsp, italc, vnc]
image: italc_icon.png
---

Following the [installation of Italc on our LTSP Server]({% post_url 2009-04-24-ltsp-install-italc-on-debian-etch %}), users reported that they had several green icons in their system tray.  This transpired to be the KDE session manager, which automatically restores all applications running at time of logging-off.  I have updated my Install Italc instructions to include excluding ica from KDE session manager.

<!--more-->

In trying to kill off the multiple ica processes, I found that `ps` can do more than just `ps aux`.  I found that `ps -fHu username` would provide a tree-view of the specified user, which is much neater than piping ps through grep.

And then our `/tmp` filesystem filled up, and I just simply could not work out why.  Until, at least, I managed to trash our virtualised Windows Server 2003 (running under Qemu), by inadvertently disabling its network card and thus triggering the server monitoring - which automatically killed and restarted it; 600mb freed up in a second.
