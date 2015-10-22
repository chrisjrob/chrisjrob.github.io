---
layout: post
title:  "Edubuntu via Wireless Laptop"
date:   2008-07-07 00:00:00
categories: technology linux ltsp
tags: ltsp edubuntu
---

Tonight I installed edubuntu-desktop from the [Edubuntu] add-ons CD - didn't take very long and very pretty it was too, once I rebooted.

Next I wanted to see if I could get my laptop working wirelessly.  I had an old Lucent Wireless Ethernet Converter, sadly only a 10-base-T model.  Configured it with a static IP address, and attached it to my laptop's network port.  Rebooted and, joy of joys, it immediately PXE booted off the Edubuntu server.

Unfortunately it was painfully slow, but nevertheless a great proof of concept for Wireless access to LTSP.

Now I just need to order a decent modern Wireless bridge and hopefully we'll have decent wireless LTSP!

[edubuntu]: https://www.edubuntu.org
