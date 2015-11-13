--- 
layout: post 
title: Debian Package NCDU
date: 2011-05-09
type: post 
published: true 
status: publish
category: technology
tags: [linux, cli, disk]
image: debian_logo.png
---

<img src="/assets/debian_logo.png" class="image-right" alt="Debian logo">

We all know that feeling when our disk fills up and you are left
desperately scrabbling around to find out where your disk space has
gone. In 
[a previous blog post I discussed the use of the wonderful Konqueror File Size View](/2011/02/24/analyse-disk-usage-with-konqueror/ "Analyse disk usage with Konqueror"),
but this is no good for remote servers. Normally I would resort to "du"
or the wonderful "find" utility to look for large files, but here is an
interesting alternative that I had not come across before: ncdu (ncurses
disk usage).

<!--more-->

Its name tells you pretty much everything you need to know. It can be
installed with a simple `apt-get install ncdu` and then the man page is
a useful guide. In simple terms it can just be run with:

    # ncdu /var

The lovely thing about ncdu is that once it completes its run (which can
take a long time on a large disk or a nfs share), you can drill into the
directory structure following the disk usage to determine where your
space has gone.

It is a very simple program but one that I will find most useful.

