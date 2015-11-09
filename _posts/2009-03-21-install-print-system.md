---
layout: post
title: Howto | Install Print System
menu: howto
date: 2009-03-21 06:06:29
weight: 40
category: technology
tags: [howto, linux, cups, wine, print]
---

## Warning

**This document is certainly incomplete and possible inaccurate.**

## Install Cups Print System

This also installs printer libraries, printing for GIMP, additional fonts etc.

    $ sudo apt-get install cupsys cupsys-client cupsys-bsd cupsys-driver-gimpprint cups-pdf cupsys-pt cupsys-driver-gutenprint libgutenprint2 gutenprint-doc gutenprint-locales foomatic-db-gutenprint foomatic-db-engine foomatic-db foomatic-db-hpijs foomatic-filters foomatic-filters-ppds hplip hplip-doc hp-ppd hpijs hpijs-ppds hplip-data python-qt3 python-sip4 psfontmgr ttf-kochi-mincho ttf-arphic-bkai00mp ttf-arphic-bsmi00lp ttf-arphic-gbsn00lp ttf-arphic-gkai00mp ttf-baekmuk gs-cjk-resource xpp linuxprinting.org-ppds 

## Wine Printing

See: http://frankscorner.org

Another way to print in Wine, steps:

   * regedit
   * in `HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Printers\~cups_printer_name~`
   * find the key "Port"
   * change it's value to `|kprinter` for KDE

When the user wants to print, the standard print dialog appears.

