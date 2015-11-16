--- 
layout: post 
title: GPS On Linux
date: 2012-09-17
type: post 
published: true 
status: publish
category: technology
tags: [linux, cli, gps]
image: gps-bu-353.jpg
---

I have bought myself a [GPS Receiver BU-353](http://www.amazon.co.uk/gp/product/B000PKX2KA/ref=as_li_ss_il?ie=UTF8&camp=1634&creative=19450&creativeASIN=B000PKX2KA&linkCode=as2&tag=robsquadnet-21).
Having plugged in the device into my Debian Wheezy workstation, I wanted
to test that it was working.

<!--more-->

A quick dmesg | tail showed me that the device has been found and
installed correctly (no drivers required).

I then installed the GPS daemon:

    $ sudo apt-get install gpsd gpsd-clients
    $ sudo dpkg-reconfigure gpsd

This then started the GPS daemon. The next thing to do was get some
example output, and the tool for this is gpspipe:

    $ gpspipe -w -n 5

Lastly, I thought it would be fun to plot the output onto Google Maps
and/or Openstreetmaps:

    $ tpv=$(gpspipe -w -n 5 | grep -m 1 TPV | cut -d, -f4,6-8,13)
    $ latitude=$(echo $tpv | cut -d, -f3 | cut -d: -f2)
    $ longitude=$(echo $tpv | cut -d, -f4 | cut -d: -f2)
    $ google_map_url="http://maps.google.com/?q=${longitude},${latitude}&z=${zoom}"
    $ osm_map_url="http://www.openstreetmap.org/?mlat=${latitude}&mlon=${longitude}&zoom=${zoom}&layers=M"
    $ xdg-open $google_map_url
    $ xdg-open $osm_map_url

All worked beautifully.

