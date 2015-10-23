---
layout: post
title:  "Home Theatre PC - Test Boot II"
date:   2010-05-22 00:00:00
categories: technology linux mythtv
tags: nvidia hdmi
---

Changing the connectors around corrected the problem, I had assumed that the arrows on the connectors indicated +ve, when clearly they must indicate -ve, fixed and the LEDs all work fine.

Installed the Nvidia binary driver, which worked fine, except that, as I've found on a few installs recently the KDE screen DPI defaults to something absurd, resulting in unreadably small fonts.  Easily fixed in KDE, via System Settings (as long as you know your way around!), but haven't yet found out how to do it in KDM (the login manager).  This is not a huge problem, as it is easy enough to type in your password, and anyway on a home theatre PC you probably want it automatically logging in.  That said, I am determined to fix this problem when I have some time.  Interestingly this was also the case on our existing mythbox, which has completely different hardware, the common thread being the nvidia driver.  I suspect the issue may be related to the KDE virtual desktop, and the nvidia driver calculating this back to a reasonable DPI.  [This link](http://wiki.archlinux.org/index.php/Xorg#Display_Size_and_DPI) may help, I will give this a go when I have some time.

Anyway, the good news is that, with the binary driver installed, the standard KDE compositing is working beautifully.

As to sound, this is still not working via HDMI, but is working fine through the sound outputs.  This seems to be a widespread issue, which I think has been resolved, so it's just a matter of waiting for the fix to filter downstream.  In the meantime, I will continue to work as we do on our existing mythbox, with a 2.1 speaker system plugged into the HTPC.

