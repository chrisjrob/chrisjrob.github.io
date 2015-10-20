---
layout: post
title:  "A flash packbox"
date:   2008-08-01 00:00:00
categories: technology floss linux ltsp
tags: packbox
---

![Packbox]({{ site.url }}/assets/pack_box_350.jpg)

Some time ago I bought the following kit:

   * [Pack-box](http://linitx.com/viewproduct.php?prodid=11791) &#163; 38.26
   * [Jetway J7F2 1.2Ghz Eden CN700 Mainboard - Fanless](http://linitx.com/viewproduct.php?prodid=11111)  &#163; 87.55
   * [6-26V 60W picoPSU-60-WI](http://linitx.com/viewproduct.php?prodid=11142) &#163; 27.55
   * [12V 60W AC Adapter](http://linitx.com/viewproduct.php?prodid=10346) &#163; 19.06

With the intention of attaching them to the underside of showroom desks as an LTSP Client.  Unfortunately they don't provide anywhere for an optical drive, which our MD felt was essential.  So what to do with it?  Well, I decided to try and set it up as a low-wattage PC for potential use in a car, caravan, boat, or simple a green PC for home use.  To that end I purchased the following additional items:

   * [Compact Flash IDE Adapter on PCI Mounting Bracket](http://linitx.com/viewproduct.php?prodid=10448) &#163; 15.34
   * [Kingston 8GB Ultimate Compact Flash 266x](http://www.dabs4work.com/productview.aspx?QuickLinx=4S39) &#163; 63.47

So the total cost of the system was &#163; 251.23 + VAT = &#163; 295.19.  Not a cheap system, but the amazing thing about it is the huge range of power input from 6V through to 26V, which means you don't need a voltage regulator for this PC to work in a car, boat or caravan.

A word about Compact Flash - there are two important things to discover before purchasing Compact Flash:

   1. *Speed:* Speed is expensive, but to have a system that compares favourably with a traditional hard-drive you need speed - 266x is recommended
   2. *Life expectancy:* Flash drives have a finite number of write cycles, and therefore you need a drive that has "wear levelling".

Whilst Kingston advertise that their drives include wear levelling, I probably would have been safer to purchase a Industrial Flash Drive available from LinITX.  At the time of writing LinITX did not offer any 8GB drives, and their 4GB drives were comparable in cost to the 8GB drive from Dabs.  Only time will tell whether this was a mistake.

My next problem was how to install without an optical drive.  In the end I followed [these instructions](https://help.ubuntu.com/community/Installation/FromUSBStick) and chose UNetBootin method, although I found that I did have to follow the additional steps required.

From that point on the installation was no more difficult than a traditional live CD install; however I did configure tmpfs file systems in `/etc/fstab` in order to reduce disk-writes.

Now I just need to find a use for it!

