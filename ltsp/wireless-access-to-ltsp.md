---
layout: page
title: "LTSP | Wireless Access to LTSP"
menu: ltsp
weight: 10
category: technology
tags: [ltsp]
---

## The Issue

Currently the only method of accessing LTSP from a wireless device (e.g. laptop) is by running the local operating system and installing NoMachine on the client.  It would be extremely useful to boot laptops directly into LTSP.

## The Options

The following two pages would seem to outline the possibilities:

   * http://www.ltsp.org/twiki/bin/view/Ltsp/WirelessLtsp
      * http://www.ltsp.org/twiki/bin/view/Ltsp/WirelessLTSPClientsUsingAnEthernetBridge

I cannot help but conclude that, time being an important factor, the Ethernet Bridge option is the sensible course to take.

## Proof of Concept

As it happened, I had an old Lucent Wireless Ethernet Converter, sadly only a 10-base-T model.  I configured it with a static IP address, and attached it to my laptop's network port.  Rebooted my laptop and, joy of joys, it immediately PXE booted.  Unfortunately it was painfully slow, so a better device is clearly required.

## Possible Wireless Bridges

   * [ASUS WL330GE Wireless Access Point](http://www.expansys.com/d.aspx?i=156998)
   * [Linksys model number WET54G](http://www.dabs4work.com/productview.aspx?Quicklinx=30HT)
   * [Belkin Wireless G Ethernet Adapter F5D7330uk](http://www.dabs4work.com/productview.aspx?quicklinx=3XB9)
   * [Buffalo Wireless Ethernet Controller WLI-TX4-G54HP-1](https://www.dabs4work.com/productview.aspx?QuickLinx=3XB9)

After initially opting for the Belkin, I ended up opting for the Buffalo, largely off the back of some decent reviews.

## Buffalo Wireless Ethernet Controller

My [Buffalo Wireless Ethernet Controller WLI-TX4-G54HP-1](https://www.dabs4work.com/productview.aspx?QuickLinx=3XB9) arrived today, so I eagerly installed it at home.  As usual there is no configurator for Linux, so you have to use the web-admin page, this requires you to connect via a wired port configured for the same network 1.1.1.0/24.  Once done it was very simple to configure - I gave it a static IP (not sure whether that was really required) and rebooted into Edubuntu.

Very straightforward, but the performance, whilst infinitely better than my old Lucent Ethernet Converter described in my [Proof of Concept](#proof-of-concept), was less than stunning.  Launching Gcompris, struggled with the music, but once the music was switched off the moving images and sound seemed fine.  Gnome seems a little sluggish at times, but probably quicker than my ageing Dell Inspiron 8200 is normally!

I guess I would describe performance of Edubuntu via Wireless as satisfactory - but if you require sound/video I think you'll struggle.  That said it is a useful additional method of accessing LTSP and will no doubt have its place at work, e.g. adhoc workstations.

## References

   * http://www.ltsp.org/twiki/bin/view/Ltsp/WirelessLtsp
      * http://www.ltsp.org/twiki/bin/view/Ltsp/WirelessLTSPClientsUsingAnEthernetBridge
   * http://www.lug-kr.de/wiki/ThinClientLokalBooten
      * http://translate.google.co.uk/translate?u=http%3A%2F%2Fwww.lug-kr.de%2Fwiki%2FThinClientLokalBooten&sl=de&tl=en&hl=en&ie=UTF-8
