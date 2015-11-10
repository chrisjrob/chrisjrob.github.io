---
layout: post
title: Howto | Install Scanning in Wine
menu: howto
date: 2009-03-21 06:16:07
weight: 40
category: technology
tags: [howto, linux, wine, scan]
---

Ensure you install the same version as wine.  For me that meant installing as follows:

    $ sudo apt-get install -t 'etch-backports' libwine-sane

<!--more-->

This worked to a fashion for me; in that it brought up a rather poor scanner dialog, and triggered the scanner, but never completed the scan job.  That said, I was using saned on LTSP (i.e. via network) which may be a step too far for libwine-sane!

