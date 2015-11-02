---
layout: page
title: Howto | Configure KNetwork Manager
menu: howto
weight: 40
---

## Configure KNetworkManager

### The Issue

KNetworkManager does not like inheriting a pre-existing `/etc/network/interfaces` file.

### The Solution

Comment out all but the following from your `/etc/network/interfaces`:

    auto lo
    iface lo inet loopback

Add the user to the `netdev` group:

    $ sudo adduser your_username netdev
