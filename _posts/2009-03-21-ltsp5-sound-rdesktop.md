---
layout: post
title: "LTSP | LTSP Rdesktop Sound"
menu: ltsp
date: 2009-03-21 06:28:35
weight: 10
category: technology
tags: [ltsp, sound, rdp]
image: ltsp_logo.png
---

<img src="/assets/ltsp_logo.png" class="image-right" alt="LTSP Logo">

## Background

Rdesktop is a problem, because it uses `/dev/dsp` as the sound device (for version 1.5 at least).  This is incompatible with ALSA.

## Solution

<!--more-->

Specifying "oss" as the sound driver, instead of the default, worked fine:

    $ padsp rdesktop -r sound:local:oss 192.168.0.1

