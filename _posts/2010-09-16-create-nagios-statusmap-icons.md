---
layout: post
title: Howto &#124; Create Nagios Status Map Icons
menu: howto
date: 2010-09-16 09:42:07
weight: 40
category: technology
tags: [howto, linux, nagios]
---

## Install GD Tools

    $ sudo apt-get install libgd-tools

## Create image in Gimp

<!--more-->

Create a suitable image in Gimp, ensuring that it has a transparent rather than a white background.

From the menu - Image &rarr; Mode &rarr; Indexed and "Generate Optimum Palette" with "Maximum number of colours: 255".

Save result as a PNG file, e.g. "router.png"

## Convert to GD2

    $ pngtogd2 router.png router.gd2 0 1
 
