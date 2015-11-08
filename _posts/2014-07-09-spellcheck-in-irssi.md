---
layout: post
title: Howto | Spellcheck in irssi
menu: howto
date: 2014-07-09 11:34:11
weight: 40
category: technology
tags: [howto, linux, irc, irssi]
---

## Introduction

This page explains how to set up spelling in Irssi on Debian Lenny.  It assumes that you have already installed irssi.

## Install packages

    # apt-get install aspell-en libaspell-dev aspell libtext-aspell-perl

Don't forget to change the localisation to match your own locale.

## Create user's scripts folder

    $ mkdir -p */.irssi/scripts/autorun

## Download the irssi script

    $ cd */.irssi/scripts
    $ wget http://www.mimir.ch/mimir/irssi/files/aspell_complete.pl
    $ cd autorun
    $ ln -s ../aspell_complete.pl

## Restart irssi

Quit irssi and restart it, you should see aspell loading and your locale mentioned.

## Testing

How the spelling functionality works is that you enter a word and then, before pressing spacebar, you hit the [TAB] key, whereon the preceding word will be spellchecked.

## Troubleshooting

If you have not installed the correct aspell localisation, then you may find that irssi segfaults.

## References

   * http://www.mimir.ch/mimir/irssi/
   * http://www.eckrall.co.uk/?page_id=55
