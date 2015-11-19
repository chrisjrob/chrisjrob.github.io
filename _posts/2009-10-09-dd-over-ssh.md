---
layout: post
title:  Howto | DD over SSH
date:   2009-10-09 00:00:00
category: technology
tags: [linux, howto, dd, ssh, cli]
---

Wow, can't believe my last post was 4 months ago, well a quick tip to get me back into the blogging frame of mind.  If you wish to take a drive image copy over the network, then apparently you do not have to have an nfs share available.  Instead you can use ssh as follows:

    $ dd if=/dev/sda bs=1M | ssh root@blah "cat > /root/disk.img"

<!--more-->

Haven't tried it yet, but it sounds incredible.  The `bs=1M` is essential or the copy will take forever.
