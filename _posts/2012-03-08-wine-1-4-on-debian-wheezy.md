--- 
layout: post 
title: Wine 1 4 On Debian Wheezy
date: 2012-03-08
type: post 
published: true 
status: publish
category: technology
tags: [linux, wine]
---

I was delighted to read this morning that [Wine 1.4 stable had been released](http://www.winehq.org/news/2012030701 "Wine 1.4 Released"), a
quick `dpkg -l wine` revealed that my Debian Wheezy install was running version 1.0.1,
several significant versions old.  There may be good stability reasons
for that decision, but I can afford to be a little more adventurous on
my desktop PC.

<!--more-->

So the question was how to build, well 
[some brief and helpful instructions are already available](http://verahill.blogspot.com/2012/03/wine-14-out-now-very-brief-build.html "Wine 1.4 out now -- very brief build instructions").

The only ways I deviated from these instructions was to use the standard
Wine option for the build:

    $ cd tmp/ $ ./tools/wineinstall

Taking the option for "no" to build without installation, and once
complete I installed with:

    $ sudo checkinstall

Checkinstall is a wonderful program to install from source via a Deb
package, that can later be uninstalled or upgraded.

Many thanks to lindqvist for saving me the hassle of working out the
dependencies!

**Update [Wine 1.5 has now been announced](http://www.winehq.org/announce/1.5.0 "Wine 1.5 Announcement")!**
