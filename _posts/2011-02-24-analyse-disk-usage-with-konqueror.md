--- 
layout: post 
title: Analyse Disk Usage With Konqueror
date: 2011-02-24
type: post 
published: true 
status: publish
category: technology
tags: [linux, kde, konqueror, disk]
---

<a href="/assets/konqueror-file-size-view.png"><img src="/assets/konqueror-file-size-view_300.png" class="image-right" alt="Konqueror File Size View"></a> 

We've all had occasions when we have needed to find where all our disk
space has gone, well under KDE3.5 it was easy - you just ran Konqueror
and then selected View » View Mode » File Size View.  But shock horror,
under KDE4 that option seemed to be missing.  Fortunately it was only an
apt-get away:

<!--more-->

    $ sudo apt-get install konq-plugins

Then run Konqueror and follow instructions above.

This is not just a static either, you can click on any directory and it
will refresh for the usage of that directory.

Is it wrong to be in love with a browser?

