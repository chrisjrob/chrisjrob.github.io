--- 
layout: post 
title: Limiting The Bandwidth Usage of apt-get and wget
date: 2011-03-31
type: post 
published: true 
status: publish
category: technology
tags: [linux, cli, bandwidth, wget, apt]
---

I have to be careful about the bandwidth I use at work; so I limit the
bandwidth of apt-get and wget.

apt-get
-------

For apt-get you just need to create a new file:

<!--more-->

    /etc/apt/apt.conf.d/76download
    
with the following contents:

    $ sudo vim /etc/apt/apt.conf.d/76download 
    Acquire {
        Queue-mode "access";
        http {
            Dl-Limit "128";
        };
    };
    $

The above will limit your bandwidth to 128K, adjust this figure to suit
your network.

Alternatively, if you don't want this change to be set permanently, then
you can specify it in the command line:

    $ sudo apt-get -o Acquire::http::Dl-Limit=128 upgrade

wget
----

To rate-limit wget, simply edit `/etc/wgetrc` or your personal
configuration at `~/.wgetrc` and add or edit the following line:

    limit-rate=128k

other
-----

Other packages can be configured in different ways, but you could
install `trickle` and then read its man page to determine how to use it.
For example (from the man page):

    $ trickle -u 128 -d 128 ncftp

