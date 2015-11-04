---
layout: post
title:  "Home Theatre PC - Continued"
date:   2010-10-14 00:00:00
category: technology
tags: [linux, mythtv] 
---

A quick post regarding the issue of myth-backend having to be restarted on every boot, this was easily fixed simply by editing the upstart configuration `/etc/init/myth-backend.conf` and adding `and udev` to the "start on" line.  Now Myth comes up correctly first time every time!

