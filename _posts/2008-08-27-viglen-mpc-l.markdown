---
layout: post
title:  "Viglen MPC-L"
date:   2008-08-27 00:00:00
categories: technology linux ltsp
tags: viglen xubuntu xfce uupc 
---

The Viglen MPC-L is a very small thin-client device, running Xubuntu with the XFCE desktop.  At &#163;99 including VAT, this is a very inexpensive PC.  I recently listened to a review of the device on the [Ubuntu UK Podcast](http://podcast.ubuntu-uk.org/).  They described the device as slow, but explained that the Viglen MPC-L is really intended as a thin client device anyway.  I decided to order a test unit for evaluation, in the hope that it would work as a thin client for our LTSP server.

My test unit has arrived, and I have added a review to my site, and include below for your interest...

First impressions are that the device is even smaller than I was expecting, it really is small enough to go on the back of a LCD panel; however the device is functional rather than attractive.  Sleek it is not.  Secondly I noticed that in common with many thin client devices there are no legacy keyboard and mouse ports, just USB (2 front and 2 back).  The device comes with a Viglen USB keyboard and Microsoft USB optical mouse, which are both fairly cheap and cheerful devices.

Next I connected it up and booted.  It was slow to boot - 2 minutes and 30 seconds.  On the flipside, once it is up power consumption is just 9 watts, increasing to 11 watts under load, so this is a device that can be left on.  Logging in only took another 10 seconds.

Once into Xubuntu, I noticed a desktop icon for "888M Volume" which apparently the standard user cannot mount, a minor point perhaps, but I would question why it is on the user's desktop.

One disappointment is that the device only has a 40GB hard drive, as stated in the Ubuntu UK Podcast, but in contrast with the 80GB promised by Viglen Sales.  A further disappointment was the screen clarity which was a long way from being pin-sharp.  A quick `sudo dpkg-reconfigure xserver-xorg` increased the screen resolution from 1024x768 to 1280x1024, but as yet I have not managed to achieve a pin-sharp display on my AG Neovo S-19 LCD Panel.  Possibly that's a limitation of the on-board graphics, but if so, health and safety would prevent its use in a corporate environment.  I will take this up with their support team.

I opened Firefox (another 20 seconds gone).  Flash isn't installed, and given the sluggish browsing performance, I don't think I'd be tempted to install it; but that does reduce the number of websites that can be accessed via this device.  Next I visited Googlemail; Googlemail took 30 seconds to load, but it was very sluggish to use.  Interestingly Viglen have also installed Opera, which was slightly quicker, probably the reason Viglen installed it.  I wonder whether they wouldn't have been better installing Seamonkey?

The Viglen MPC-L comes with Abiword, Gnumeric and Gimp, which I believe are the default XFCE applications and probably a wise choice for a device this slow.

Interestingly Viglen state in their literature:

*"Viglen have tuned and tweaked this distribution for optimal performance on the MPC through the use of  various  techniques  and  tricks.  Load  times  and  startup  times  have  been  greatly  reduced  through adaptive  analysis  techniques  and  removing  unnecessary  startup  scripts."*

Hmmm.

So as a standalone PC, it has few merits beyond size and price, but we must remember, that this is a &#163;100 PC, and Viglen have been clear about the fact that this device is really designed to be a thin client.

So, with my corporate hat on, I looked for Citrix Presentation Server Client, the preferred method of connecting to a Citrix server.  Not installed.  Oh well, I guess most people will be connecting to an ordinary Microsoft Terminal Server via RDP.  Looked for an RDP application (krdc on KDE - anyone know for XFCE?), but couldn't find one.  Okay, so any sysadmin is going to set up a desktop shortcut for rdesktop, but rdesktop is also not installed.  Only an apt-get away perhaps, but the minimum I would have thought for a device purporting to be a thin client device.  Next I looked for NoMachine's NX client, again not installed.  VNC?  2X?  No.

If Viglen really want this device to be considered a thin client device, then those applications really ought to be there, and it would cost them nothing so to do, as all the software is free.  I installed rdesktop and was quickly able to connect to our virtualised W2K3 server, no problems there then.

I then decided to test the device as a thin client for LTSP.  So rebooted and tried to get into the BIOS.  The boot splash states F1 for Setup, but when you press it nothing happens, instead there is a message stating "VSA USB Enumeration" and the boot process continues regardless.  So configuring PXE booting is going to be a little difficult, perhaps impossible.  The inability to reach the BIOS screen must surely be a fault - and something that I will investigate further.

The problem with the Viglen MPC-L is that it is neither fish nor fowl - it is too slow to be seen as a viable PC, but it has not been properly set up to use as a thin client.  This means that the cost of these devices needs to include some not insignificant time for a sysadmin to install and configure the requisite software to access their server.

Criticisms aside, this is tremendously good value at &#163;99 and an environmentally friendly device.  At the current promotional price of &#163;80 it really is tremendous value for money, and if you deduct VAT and then a further &#163;8 for the keyboard and mouse, then this device will cost a company just &#163;60, an astonishing price.  For me, though, unless I can resolve the PXE issue, the device is going to be of little use.

Cheap, but not entirely cheerful.

