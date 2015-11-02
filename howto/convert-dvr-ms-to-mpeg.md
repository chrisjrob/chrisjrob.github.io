---
layout: page
title: Howto | Convert DVR-MS to MPEG
menu: howto
weight: 40
---

## Convert dvr-ms to mpeg

### Simple bash script to convert all dvr-ms files in a directory

    #! /bin/bash
    for a in *.dvr-ms; do
        if [ -f "$a" ]; then
            b="${a%.dvr-ms}"
            ffmpeg -i "$a" -vcodec copy -acodec copy "${b}.mpg"
        fi
    done

