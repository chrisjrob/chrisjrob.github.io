---
layout: post
title:  "Screen Shadowing"
date:   2008-07-10 00:00:00
categories: technology floss linux ltsp
tags: x11vnc italc
---

Something that we have become used to having under Citrix is the ability to shadow users, and I have been missing this since our forays into LTSP.  I know it is possible, and I have been attempting to use the KDE built-in Krfb Desktop Sharing module.  The problem with this has been that, all users being on the same hardware, it's difficult to know to which screen number to connect.  I guess there probably is a way, but when I used trial and error to find the right display, the performance was less than impressive.

So I decided to follow the masses and install x11vnc on the client, but suffice don't have it working yet!

You may recall my recent installation of Edubuntu at home.  Well I was surprised to find that the Thin Client Manager, AKA the Student Control Panel, missing.  I Googled without joy, and ended up finding that thin-client-manager-gnome needed to be installed via Synaptic.  I reported this at #edubuntu and ogra informed that they have replaced this with [iTalc](http://italc.sourceforge.net/).  I therefore removed thin-client-manager-gnome, but again I could not find any reference to iTalc in the menus.  Again I Googled fruitlessly and again the solution was as simple as installing italc-master (the client was already installed).  And it worked, straight off including screen shadowing.

Now all I need to do is to work out how to install iTalc on Etch!  Perhaps not.  At least not just yet.



