--- 
layout: post 
title: Irssi Spellchecking
date: 2013-06-12
type: post 
published: true 
status: publish
categories: technology linux
tags: cli irc
---

Having migrated servers, my irssi tab-complete spell-check facility had
broken; so I decided to document the process of getting it working.

Firstly install the required packages:

    $ sudo apt-get install aspell-en libaspell-dev aspell libtext-aspell-perl

<!--more-->

Secondly, create your user's script folder, if not already present:

    $ mkdir -p ~/.irssi/scripts/autorun

Now, download the aspell script:

    $ cd ~/.irssi/scripts
    $ wget http://scripts.irssi.org/scripts/aspell_complete.pl
    $ cd autorun
    $ ln -s ../aspell_complete.pl

Lastly, either restart IRSSI, or, in type:

    /script load ~/.irssi/scripts/autorun/aspell_complete.pl
