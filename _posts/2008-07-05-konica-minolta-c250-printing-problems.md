---
layout: post
title:  "Konica Minolta C250 Printing Problems"
date:   2008-07-05 00:00:00
category: technology
tags: [linux, printing, cups] 
---

<img src="/assets/c250.png" class="image-right" alt="The Konica Minolta C250">

## The Issue

From Linux, only simple print jobs will print, more complicated print jobs never come through, the data light flashes indefinitely and the photocopier needs to be rebooted.

We have tried various drivers from Konica Minolta, including C250, C252 and C253, but with no improvement.

<!--more-->

In particular we have problems printing PDFs and wep-pages in Iceweasel.  Web-pages in Konqueror seem okay, which makes you think that the problem is with the non-KDE applications, but the PDFs that won't print from Acrobat Reader, also won't print from KPDF.

## Progress

I am fortunate in having some help from [Transcribe Thames](http://www.thamesgroup.com/).  Simon has set-up an Ubuntu desktop and has proved that he can print fine to a C250.  Simon felt that the only difference between our two set-ups was the fact that we still had windows active directory LDAP authentication on it.  I have today removed, but printing is not improved.

## Next Step

Simon has asked me to try again on a fresh Ubuntu desktop.


