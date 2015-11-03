--- 
layout: post 
title: Google Chrome Flash Plug In Blocked
date: 2011-03-13
type: post 
published: true 
status: publish
category: technology
tags: google chrome flash
---

Google Chrome started stating *"The Flash plug-in was blocked because it is out of date."*.

To fix this I entered "about:plugins" in the address bar, and clicked
"disable" against Flash. This results in Google Chrome falling back on
the version of Flash installed in the operating system. If you do not
have Flash installed, then in Debian you can install as follows:

<!--more-->

Firstly ensure that the repositories in `/etc/apt/sources.list` include
"non-free", for example:

    deb http://ftp.uk.debian.org/debian squeeze main contrib non-free

Then install Adobe Flash with:

    $ sudo apt-get update $ sudo apt-get install flashplugin-nonfree

And you should now have a working Flash installation. I have tested You
Tube and all seems to be well, but I will update this page if I find any
issues.

By the way, I would obviously prefer to run Chromium, the open source
version of Chrome, but at the moment the version in Squeeze is outdated,
and there are no backports yet for Wheezy.

