---
layout: post
title:  "How to Synchronise files with Unison"
date:   2009-03-21 00:00:00
category: technology
tags: [linux, unison, sync]
---

## Warning

These instructions worked for the author - they may not work for you.

## Installing Unison

You need to install unison on both machines, unison-gtk probably only on the client.

<!--more-->

    $ sudo apt-get install unison unison-gtk

N.B. unison-gtk is an optional component - if you are comfortable working from the command line.

## Using Unison

Under KMenu / Utilities there should be an option for Unison File Synchronisation.

    $ cd ~
    $ mkdir unison

A sample `~/.unison/default.prf` config file is shown here:

    # Unison preferences file
    root = /home/user/unison
    root = ssh://user@remote.server/unison
    follow = Regex .*

This is a simple configuration which will synchronise a directory called "unison" under the user's home directory to a users "unison" directory on "remote.server".  If the unison directory includes symbolic links, then it will follow the link and copy the actual file, if this is not what you want, simply delete the "follow" line.

