---
layout: post
title: Howto | Configure KNetwork Manager
menu: howto
date: 2009-03-21 05:57:01
weight: 40
category: technology
tags: [howto, linux, knetwork-manager]
---

## The Issue

KNetworkManager does not like inheriting a pre-existing `/etc/network/interfaces` file.

## The Solution

Comment out all but the following from your `/etc/network/interfaces`:

    auto lo
    iface lo inet loopback

Add the user to the `netdev` group:

    $ sudo adduser your_username netdev
