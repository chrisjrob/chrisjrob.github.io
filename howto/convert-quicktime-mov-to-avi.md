---
layout: post
title: Howto | Convert Quicktime MOV to AVI
menu: howto
date: 2009-03-21 05:57:44
weight: 40
category: technology
tags: [convert, quicktime, mov, avi, ffmpeg]
---

    $ ffmpeg -i "source.mov" -sameq -vcodec msmpeg4v2 -acodec pcm_u8 "output.avi"
