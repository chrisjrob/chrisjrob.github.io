---
layout: post
title:  "Microsoft XPS under Linux"
date:   2010-08-04 00:00:00
category: technology
tags: [linux, xps, pdf, konqueror]
---

A member of staff asked how he could open a personal XPS file, created in Windows 7.  Now XPS is the Microsoft replacement for PDF and it is apparently installed as a printer by default in Vista and Windows 7, which means increasingly people are going to start sending XPS files whether we like it or not.

<!--more-->

Fortunately it seems XPS is supported in Okular under KDE4 (which we don't have yet), and can also be readily converted to PDF using the Ghostscript "gxps" tool.  This has to be built from source, but proved relatively simple.  As our users do not have access to the command line, I also had to also create a Konqueror service menu, to enable right-click Action "Convert XPS to PDF".

I am pleased to say it all works beautifully, and I have typed up my instructions for Debian Lenny here:

   * [Howto | Convert XPS to PDF]({% post_url 2013-03-12-convert-xps-to-pdf %})
