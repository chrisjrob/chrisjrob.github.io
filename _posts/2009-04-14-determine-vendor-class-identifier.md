---
layout: post
title: Howto | Determine vendor-class-identifier
menu: howto
date: 2009-04-14 07:49:13 
weight: 40
category: technology
tags: [howto, linux, dhcp]
---

## Introduction

All the advice about DHCP and PXEClient tells you about the ability to configure based on the client's vendor-class-identifier string, but nowhere tells you how to find out the contents of this magical string.  In fact it couldn't really be easier, as the following instructions explain:

## Step 1 - Update DHCP Server

Simply modify `/etc/dhcp3/dhcpd.conf` on your DHCP server and add the following somewhere near the top:

    # So that the vendor-class-identifier shows in dhcpd.leases file
    set vendor-string = option vendor-class-identifier;

## Step 2 - Restart your DHCP server

    # /etc/init.d/dhcp3-server restart

## Step 3 - Test Boot a Client

Then boot a client and look at the contents of the `/var/lib/dhcp3/dhcpd.leases` file, you should find entries like this:

    lease 192.168.0.174 {
        starts 2 2009/04/14 07:40:21;
        ends 2 2009/04/14 13:40:21;
        binding state active;
        next binding state free;
        hardware ethernet 00:fb:3d:5f:fg:7e;
        set vendor-string = "PXEClient:Arch:00000:UNDI:002001";
    }

