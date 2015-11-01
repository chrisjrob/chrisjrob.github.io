---
layout: page
title: "LTSP | LTSP Rdesktop Sound"
menu: ltsp
weight: 10
---

## Rdesktop Sound

### Background

Rdesktop is a problem, because it uses `/dev/dsp` as the sound device (for version 1.5 at least).  This is incompatible with ALSA.

### Solution

Specifying "oss" as the sound driver, instead of the default, worked fine:

    $ padsp rdesktop -r sound:local:oss 192.168.0.1

