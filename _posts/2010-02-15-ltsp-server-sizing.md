---
layout: post
title: "LTSP | LTSP Server Sizing"
menu: ltsp
date: 2010-02-15 15:09:47
weight: 10
category: technology
tags: [ltsp]
---

## RAM

LTSP website recommends 256mb for the core system plus 50mb per user:

    Total RAM = 256mb + (25 users x 50mb)
              = 1506mb

However Edubuntu recommends a different formula:

    Total RAM = 150mb x 25 users
              = 3750mb

We recommend you choose the greater of the two, and double-it if you can (see update below).

<!--more-->

### Post install update

This memory has proved a little low, mainly because we are also virtualising Windows on the same server.  If you don't require Windows, or you are providing that service from a different server, then the higher of these two figures should be sufficient; I would certainly recommend the higher figure, because of the high memory demands of Firefox and Adobe Flash.

## CPU

LTSP website states that each user is likely to require around 3% of a CPU:

    Total CPU = 3% x 25
              = 0.75
              = 75% of a CPU

So a single processor should be sufficient; however this requirement doubles or even trebles if we opt to virtualise a Windows server on the installation.  We would say that a minimum of a quad-core would be sensible if virtualising Windows on the LTSP server.  If this is a problem for you, simply host the Windows server elsewhere; which is probably better anyway.

### Post install update

We have now upgraded both servers to dual quad-core, which is proving ample capacity.  I believe a single quad-core would have been ample had we not been virtualising windows on the same server.

## Network

LTSP recommend a Gigabit connection for the server and fast Ethernet for the terminals.  Many fast ethernet switches include a gigabit connection, alternatively gigabit switches are becoming quite affordable.

**There can be issues running LTSP via multiple switches - so if you're buying a new switch - consider the greatest number of ports that you are likely to require.**

### Post install update

This has all provided to be correct - Gigabit on the server is nearly essential if you want decent performance and similarly, PCs with only old 10-base-t internet are noticeably slower to boot.
