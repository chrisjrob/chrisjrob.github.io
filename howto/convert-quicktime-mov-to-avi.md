---
layout: page
title: Howto | Convert Quicktime MOV to AVI
menu: howto
weight: 40
---

## Convert Quicktime MOV to AVI

    $ ffmpeg -i "source.mov" -sameq -vcodec msmpeg4v2 -acodec pcm_u8 "output.avi"
