---
layout: post
title: Howto &#124; Build VirtualBox from Source
menu: howto
date: 2009-03-21 05:33:10
weight: 40
category: technology
tags: [linux, howto, virtualisation]
---

## Download

Download Open Source Edition (OSE) from VirtualBox:

   * http://www.virtualbox.org/wiki/Downloads

<!--more-->

## Pre-requisites

Install the following pre-requisites:

    # apt-get install gcc g++ bcc iasl xsltproc xalan libxalan110-dev uuid-dev zlib1g-dev libidl-dev libsdl1.2-dev libxcursor-dev libqt3-headers libqt3-mt-dev libasound2-dev libstdc++5 libhal-dev

## Compile

    # sudo su
    # ./configure
    # . env.sh  << Note the space between the '.' and 'env'
    # kmk all

## Installation

    # cd out/linux.x86/release/bin/src
    # make
    # make install
    # cd ..

## References

This document has been copied from the following, which you should read as your primary source.

   * http://www.virtualbox.org/wiki/Linux%20build%20instructions

I also found the following (suitably adapted for Debian) to be most useful:

   * http://www.howtoforge.com/virtualbox_ubuntu

Although I could not get subversion working from behind our proxy server, the source for 1.5.2 was downloadable at the above site.

