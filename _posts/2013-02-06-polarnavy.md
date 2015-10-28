--- 
layout: post 
title: Polarnavy
date: 2013-02-06
type: post 
published: true 
status: publish
categories: technology
tags: 
---

Following [an earlier post on using
GPS](/2012/09/17/gps-on-linux/ "GPS on Linux") under Ubuntu, I have been
trying to get [PolarNavy](http://www.polarnavy.com/ "Polar Navy")
working under Ubuntu 12.10. Polar Navy is the only Linux chart
navigation software available for Linux. I know people will correct me
by quoting [OpenCPN](http://opencpn.org/ "OpenCPN"), but there are no
charts currently legally available for the UK, at least that I could
find.

Polar Navy has two components - PolarCOM which communicates with the GPS
receiver, and PolarView which displays the actual charts. The two
applications can connect together, to show the vessel's current
position.

I had Polar Navy working fine under Ubuntu 12.04 i386, but for some
reason I had problems running under Ubuntu 12.10 amd64. The problem was
that PolarCOM would simply not display the position, i.e. the Lat and
Long. I tried running from the command line, and there were a large
number of errors when running PolarCOM, for example:\

``  `menu_proxy_module_load': ./PolarCOM.bin: undefined symbol: menu_proxy_module_load (PolarCOM.bin:4487): Gtk-WARNING **: Failed to load type module: (null) ``

I eventually fixed that by adding the following to the
/opt/polarcom/bin/PolarCOM script:

` export UBUNTU_MENUPROXY=0`

Sadly PolarCOM was still not working. The GPS Receiver that I use is the
BU-353, a terrific piece of hardware that "just works" under Linux. This
is the recommended GPS for Polar Navy, which was a happy coincidence.
When I plugged in the receiver it was detected as /dev/ttyUSB0, which I
noticed had a group "dialout". I added myself to that group:

`$ sudo adduser dialout`

I posted [a request for
help](http://support.polarnavy.com/forum/read.php?1,494 "PolarNavy support")
on the Polar Navy forums and they suggested I connect directly to the
receiver using screen. I was unsure how to terminate that session, but
ended up killing the screen session (Ctrl+Alt+a followed by k to kill).
There is probably a better way - feel free to comment below.:

` $ screen /dev/ttyUSB0 4800`

But doing so just output a load of binary garbage, which I realised
(with help from Surrey LUG IRC \#surrey on irc.lug.org.uk) meant that
the receiver was no longer in NMEA mode. Apparently GPSD automatically
reconfigures the receiver to SIRC III binary. I have no idea why this
was not a problem in Ubuntu 12.04.

To fix this problem I needed to ensure that GPSD was not running.
Unfortunately stopping the service does not seem to terminate the
process, so I also had to kill it off:

` $ sudo service gpsd stop $ ps aux | grep gps $ killall PolarCOM.bin`

Next I placed the GPS receiver into NMEA ASCII mode, instead of SIRCIII
Binary mode:

` $ gpsctl -f -n /dev/ttyUSB0`

Lastly, you may also need to configure the serial port, although I did
not need to do this:

` $ stty -F /dev/ttyUSB0 ispeed 4800`

A quick check to see that we are getting ASCII NMEA sentences, showed
that it was working perfectly, with easy to read text output from the
receiver.

` $ screen /dev/ttyUSB0 4800`

To prevent GPSD from reconfiguring the receiver again, I then needed to
reconfigure it to use read-only mode:

`$ sudo dpkg-reconfigure gpsd`

And at the point where it requests switches, I added "-b" (Broken Device
Safety Mode), otherwise known as read-only mode.

With trepidation I launched PolarCOM, which immediately showed my
current position.

