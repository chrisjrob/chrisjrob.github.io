--- 
layout: post 
title: Ubuntu Simple Scan HP All in One
date: 2016-1-2 12:14:12
type: post 
category: technology
tags: [linux, ubuntu, printing, cups, scan, hp]
image: hp-j6410.jpg
published: true
---

At home we have an HP OfficeJet J6410 printer, which has worked brilliantly for years. 
Unlike every previous printer we've owned, this printer sits happily on our network and seems perfectly content to be used only very occasionally, whereon it willingly responds with decent quality prints and scans.

I have set up the printer with a static IP address and so the scanning is managed via the web interface `http://192.168.0.100/webScan`, whereon the scanned image opens a new tab in the browser, enabling you to save to wherever.

This printing and scanning Nirvana hit a road bump today, when it just instantly went to "Scan done" and failed to actually do anything.
Rebooting the laptop, the printer and clearing temporary internet files all failed to resolve the problem, as did changing from Chrome to Firefox.

<!--more-->

In desperation I tried running Ubuntu Simple Scan, but predictably enough it did not find the printer. 
A quick Internet search took me to [this excellent Ubunutu community page][ubuntu-hpallinone]. 

I opened a terminal and typed:

    $ hp-makeuri 192.168.0.100

    CUPS URI: hp:/net/Officejet_J6400_series?ip=192.168.0.100
    SANE URI: hpaio:/net/Officejet_J6400_series?ip=192.168.0.100
    HP Fax URI: hpfax:/net/Officejet_J6400_series?ip=192.168.0.100

    Done.

I then typed (taking the SANE URI from above):

    simple-scan hpaio:/net/Officejet_J6400_series?ip=192.168.0.100

And it worked perfectly! Flushed with success I read on to see how to make this a permanent fixture, and it turned out that all I needed to do was configure the CUPS URI for the printer itself (it was previously set to something like `socket://192.168.0.100`):

    $ vim /etc/cups/printers.com

    DeviceURI hp:/net/Officejet_J6400_series?ip=192.168.0.100

And now simply running Ubuntu Simple Scan works perfectly.

Thank you Ubuntu community!

[ubuntu-hpallinone]: https://help.ubuntu.com/community/HpAllInOne

