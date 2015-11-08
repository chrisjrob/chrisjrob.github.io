---
layout: post
title: Howto | Convert DVR-MS to MPEG
menu: howto
date: 2009-03-10 22:02:23
weight: 40
category: technology
tags: [howto, convert, cli, dvr-ms, mpeg]
---

## Simple bash script to convert all dvr-ms files in a directory

    #! /bin/bash
    for a in *.dvr-ms; do
        if [ -f "$a" ]; then
            b="${a%.dvr-ms}"
            ffmpeg -i "$a" -vcodec copy -acodec copy "${b}.mpg"
        fi
    done

