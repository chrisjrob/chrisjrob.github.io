---
layout: post
title:  "Konica Minolta C250 Printing Problems"
date:   2008-08-23 00:00:00
categories: technology linux
tags: printing cups 
---

A month ago I wrote about [our problems printing to our colour photocopier]({% post_url 2008-07-23-konica-minolta-c250-printing-problems %}).  Well this problem is still hurting us.  I have tried setting up cups to work by lpr, ipp, http, socket and jetdirect.  Amazingly I was able to print CUPS test pages from most of these, but without it making any difference to the problem.  I have tried switching off CUPS in Iceweasel, so that it prints via kprinter (see Configure Iceweasel to print via kprinter), but amazingly the problem continues.

Looking through the CUPS error.log, I noted an error on locale, so I reconfigured:

    $ sudo dpkg-reconfigure locales

And I added the three en\_GB locales, and set the UTF-8 as the default.  I also change the test web-page to use en\_GB.  This eradicated the error messages, but did not induce the photocopier to print.

I have tried using four different PPDs from Konica Minolta and from [OpenPrinting.org](http://openprinting.org), but without any difference.

This is without doubt the most intractable problem that I have as yet encountered in Linux.

Interestingly, I *was* able to print the same webpage from Iceweasel3 [from my new Debian Sid PC]({% post_url 2008-08-20-kubuntu-to-debian-sid %}).  When setting up the printer the PPD was already available from within CUPS, which I will need to investigate further, although my suspicion is that the key change is the browser.  Maybe I need to upgrade to Iceweasel 3, although this is only available in Experimental at present, which would not be sensible for our LTSP server.

I do feel that I am between a rock and a hard place.
