---
layout: post
title:  Howto | Optimise Firefox
date:   2009-10-15 00:00:00
category: technology
tags: [howto, linux, firefox, sqlite]
---

Apparently Firefox uses sqlite for its databases, maintaining several `*.sqlite` files in your `.mozilla/` profile directory.  Over time these become cluttered and it helps if you vacuum it:

<!--more-->

    $ sudo apt-get install sqlite3
    $ cd ~
    $ find .mozilla/ -iname '*'.sqlite -exec sqlite3 "{}" VACUUM \;

