--- 
layout: post 
title: Pekwm With Tint2 Panel
date: 2011-03-07
type: post 
published: true 
status: publish
category: technology linux pekwm
tags: tint2
---

<a href="/assets/2011-03-pekwm-snapshot.png"><img src="/assets/pekwm-snapshot_300.png" class="image-right" alt="PekWM with Tint2 Panel"></a>

I have just been recommended to try the "tint2" panel. It looks lovely
and minimalist, and has happily taken the kwalletmanager system tray
icon; so hopefully will work on my laptop with battery and wireless
monitors.

<!--more-->

Whilst you're looking at my screenshot, note the Window grouping between
Google Chrome and Iceweasel and the two terminal windows grouped
together. The window grouping feature really is very, very handy.

Installing tint2 is simple:

    $ sudo apt-get install tint2

And then add tint2 to your `~/.pekwm/startup` file:

    tint2 &

If you need to configure it, then edit `~/.config/tint2/tint2rc`; so far
I have found the defaults to be okay.

Update: Battery monitor
-----------------------

To get the built in tint2 battery monitor, simply edit

    ~/.config/tint2/tint2rc:
    battery = 1 battery_hide = never

