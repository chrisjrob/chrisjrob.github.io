---
layout: post
title:  "Changes to the website"
date:   2008-07-05 00:00:00
categories: technology linux ltsp
tags: printing
---

I can't believe a week has passed, with no blog entry.  Apologies.

This week I have added my About Linux and About Windows pages, including Why Linux and Protecting your Windows PC.  I hope that these pages will help users to recognise the issues running Windows systems and consider using Linux instead.  I have also moved my Windows for Linux page under the About Linux.  Still don't think I have the site layout quite right yet, so don't be surprised if they all move around again!

<!--more-->

This week has seen a big push to get our last Windows users over to LTSP.  It's gone pretty well, although we still have problems printing to our photocopier, a Konica Minolta C250, I will be publishing some details on this problem under Work in Progress.  I have three users remaining, all three of which will prove the greatest challenge, but also the greatest opportunity - in some ways they have the most to gain from Linux.  They just don't know it yet!

## Konica Minolta C250 Printing Problems

### The Issue

From Linux, only simple print jobs will print, more complicated print jobs never come through, the data light flashes indefinitely and the photocopier needs to be rebooted.

We have tried various drivers from Konica Minolta, including C250, C252 and C253, but with no improvement.

In particular we have problems printing PDFs and wep-pages in Iceweasel.  Web-pages in Konqueror seem okay, which makes you think that the problem is with the non-KDE applications, but the PDFs that won't print from Acrobat Reader, also won't print from KPDF.

### Progress

I am fortunate in having some help from [Transcribe Thames](http://www.thamesgroup.com/).  Simon has set-up an Ubuntu desktop and has proved that he can print fine to a C250.  Simon felt that the only difference between our two set-ups was the fact that we still had windows active directory LDAP authentication on it.  I have today removed, but printing is not improved.

### Next Step

Simon has asked me to try again on a fresh Ubuntu desktop.


