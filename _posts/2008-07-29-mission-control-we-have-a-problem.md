---
layout: post
title:  "Mission Control - We have a Problem"
date:   2008-07-29 00:00:00
category: technology
tags: [linux, firewall, vodafone]
image: ipcop_logo.png
---

Our ADSL connection went down yesterday morning, taking with it our websites, email and browsing.  It is amazing how cut-off you feel without Internet access.  We have a fully-managed service, so Clara.net sent out a replacement router, only to find that the problem was elsewhere and that they had to log the fault with BT.

<!--more-->

Thinking that our Internet access could be out for days, I decided to try and utilise my laptop's Vodafone 3G modem.  After a little research on my Eee PC I discovered that IPCop firewall can only handle a single WAN interface, so I decided to build a temporary IPCop firewall for the purpose:

   *  [Install IPCop Firewall]({% post_url 2009-10-12-install-ipcop-firewall %})

