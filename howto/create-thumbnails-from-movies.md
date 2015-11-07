---
layout: post
title: Howto | Create Thumbnails from Movies
menu: howto
date: 2009-03-15 20:08:39
weight: 40
category: technology
tags: [linux, cli, ffmpeg]
---

## Introduction

Sometimes you want to catalogue your movies with thumbnail images from the movie.

## The Solution

    $ ffmpeg -itsoffset -240  -i themovie.mpg -vcodec mjpeg -vframes 1 -an -f rawvideo -s 320x240 thumbnail.jpg
    $ ffmpeg -itsoffset -240  -i themovie.mpg -vcodec png -vframes 1 -an -f rawvideo -s 320x240 thumbnail.png

## Example Script

The following example script should be saved in `/usr/local/bin` or somewhere in your path.  As you can see, this script will run through all the movies in the current directory and create thumbnails in the default mythtv MythVideo directory.

This script was written to perform a particular task, and a more generic script would be better.

    #!/bin/bash
    # Creates a thumbnail of an mpeg

    for a in *.mpg; do
        if [ -f "$a" ]; then
            b="${a%.mpg}"
            if [ -f "/home/mythtv/.mythtv/MythVideo/${b}.jpg" ]; then
                echo "/home/mythtv/.mythtv/MythVideo/${b}.jpg already exists"
            else
                ffmpeg -itsoffset -240  -i "$a" -vcodec mjpeg -vframes 1 -an -f rawvideo -s 320x240 "/home/mythtv/.mythtv/MythVideo/${b}.jpg"
            fi
        fi
    done
