---
layout: post
title:  "Ubuntu LTSP - how the other half live?"
date:   2008-07-06 00:00:00
category: technology 
tags: [linux, ltsp, ubuntu]
image: edubuntu_8.04.png
---

<img src="/assets/edubuntu_8.04.png" class="image-right" alt="Edubuntu 8.04">

Having a brand new HP ML115 Server which I bought new for £107, I decided to have a play with [Ubuntu] LTSP at home.  Actually I decided on [Edubuntu], as I wanted to investigate the thin client management which I believe are included.

I downloaded the [Ubuntu Alternate CD][alternate] and burned it to disk.  I booted the server onto the CD, missed the fact that I needed to hit F4 Modes and select LTSP before selecting install, whereon I wasted an hour installing Ubuntu-ordinaire.

<!--more-->

Second attempt was pretty straightforward, but, only having a single network card, it warned me to edit `/etc/ltsp/dhcpd.conf`.  Booted into Ubuntu without a problem and opened my router's web interface and cribbed the DHCP settings and DNS settings into `/etc/ltsp/dhcpd.conf`.  Switched off the DHCP on my router.  Set-up the server static IP address via the Gnome network manager.  Restarted DHCP with `/etc/init.d/dhcp3-server restart`.

Tested a client and got the "workstation not authorized".

Ran `sudo ltsp-update-sshkeys` and `sudo ltsp-update-image`, rebooted the client and it worked beautifully, by which I mean that the laptop's full 1600x1200 resolution was detected, and sound kicked in immediately.

So, even with the false starts, I managed to install a working Ubuntu LTSP server with all the bells and whistles in two and a half hours.  And I could have done it at least an hour quicker than that.  I know Ubuntu come in for some criticism, but that really is impressive usability.  To be fair, I was helped by having knowledge of LTSP, DHCP, and Debian, but supposedly a second network card would have enabled the whole kit-and-kaboodle to work out of the box.

Tomorrow I will have a crack at installing the Edubuntu-Desktop!

Good night.

[Ubuntu]: http://www.ubuntu.com/
[Edubuntu]: https://www.edubuntu.org/
[alternate]: http://www.ubuntu.com/download/alternative-downloads
