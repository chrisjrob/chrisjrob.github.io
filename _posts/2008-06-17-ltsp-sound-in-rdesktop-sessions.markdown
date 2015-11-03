---
layout: post
title:  "LTSP sound in rdesktop sessions"
date:   2008-06-17 00:00:00
category: technology
tags: [linux, ltsp, sound, rdp]
---

Today I discovered that since our upgrade to LTSP5, sound has stopped working in rdesktop sessions.  Worse, it bombs users out of their Windows session with the error:

    rdesktop: pcm_params.c:2351: sndrv_pcm_hw_params: Assertion `err >= 0' failed.
    Aborted

<!--more-->

Under 4.2 it was working beautifully simply by prefixing rdesktop with esddsp, 
e.g.

    $ esddsp rdesktop -r sound:local 192.168.0.1

But removing esddsp or replacing with padsp causes exactly the same error 
message.  I suspect with alsa the esddsp/padsp fix is no longer required, but 
why does it not work?

I have even tried pointing padsp at the client pulseaudio device...

    $ padsp -d -s 192.168.0.41:4713 -n rdesktop rdesktop -r sound:local 192.168.0.1

I have posted this as a question on the LTSP Mailing List and am hopeful of a solution!

