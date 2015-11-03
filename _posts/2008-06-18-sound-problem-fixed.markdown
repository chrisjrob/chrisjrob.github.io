---
layout: post
title:  "LTSP sound problem fixed"
date:   2008-06-18 00:00:00
category: technology 
tags: [linux, ltsp, sound, rdp]
---

It transpired that rdesktop uses `/dev/dsp` which is incompatible with alsa.  Specifying "oss" as the sound driver, instead of the default, worked fine.

    $ padsp rdesktop -r sound:local:oss 192.168.0.1

<!--more-->

This is apparently because rdesktop version 1.5 does not support alsa, but still uses `/dev/dsp` as the sound device.  A new version 1.6 of rdesktop is now available (albeit not in the debian etch or etch-backports repositories), which should address this issue.  Unfortunately we are using a patched version of rdesktop, provided by fontis, and I know they were struggling to integrate their patches into the latest versions.  I should probably attempt to contact them at some point.

This also represented my first attempt at using IRC #ltsp - which proved invaluable.  Installed Konversation, as I could not get on with Kirc.
