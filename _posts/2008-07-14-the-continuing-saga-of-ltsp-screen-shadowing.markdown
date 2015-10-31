---
layout: post
title:  "The Continuing Saga of LTSP Screen Shadowing"
date:   2008-07-14 00:00:00
categories: technology linux ltsp
tags: x11vnc italc
---

This turned out to be a complete nightmare, and took several days to resolve.  I never did manage to get x11vnc working on the client, nor did I manage to get italc (which I think also uses x11vnc) working on the client.  In the end I settled for installing italc-client on the server, so that the client runs when users log onto the server, allocating each user a unique port, and putting a little green italc icon in their system tray.

<!--more-->

This required upgrading qt4 from lenny (hardly ideal) and still works like a pig.  Well viewing is fine, but the remote control is unusably slow.

I found it impossible to manage the list of users in italc; which changes according to the whims of DHCP.  I ended up writing a script to use the output of "who" to populate the `globalconfig.xml` file in `/home/username/.italc`; if I have time I will add the script to my install italc instructions.

