---
layout: post
title:  "LTSP | Sound on Compaq ENSFF PCs"
date:   2008-06-21 00:00:00
category: technology 
tags: [ltsp, sound]
---

We have a number of Compaq Deskpro ENSFF P450s for which sound stopped working since our [LTSP5 Upgrade]({% post_url 2010-06-25-ltsp5-upgrade %}).  I spent some time this morning solving this problem and have detailed [my solution below](#configure-compaq-deskpro-ensff-for-ltsp5-sound).

The bulk of the fix was simply changing `SMODULE_01` to `MODULE_01` in LTS.conf, although this particular PC was a little more involved.

<!--more-->

## Configure Compaq Deskpro ENSFF for LTSP5 Sound

### Introduction

We have a number of Compaq Deskpro EN-SFF P450 PCs.  These are small-form-factor Pentium IIIs with Compaq quality.  I believe these have the ESS1869 soundcard.

**The BIOS settings on our PCs are io=0x220 irq=5 dma=1 dma16=5; your settings may be different!**

## LTSP4.2

They worked flawlessly under LTSP4.2 with the following LTS.conf configuration:

    SMODULE_01         = "snd-es18xx irq=5"

Since upgrading to LTSP5, sound has ceased to function.

## Testing

I booted the client and typed [Ctrl]+[Alt]+[F1] to bring up the client console and typed:

    # lsmod | grep snd

Which returned nothing, showing that sound was definitely not loaded (no surprise there!).

Next I tried typing:

    # modprobe snd-es18xx
    ESS AudioDrive ES18xx soundcard not found or device busy
    FATAL: Error inserting snd_es18xx (/lib/modules/2.6.18-6-486/kernel/sound/isa/snd-es18xx.ko): No such device

## Research

Next I Googled "(ltsp5|edubuntu) snd-es18xx" which produced the following thread:

   * http://ubuntuforums.org/showthread.php?t=148077

This was not specific to LTSP5, nevertheless it gave a useful configuration:

    /etc/modprobe.d/alsa-base

    alias char-major-116 snd
    alias snd-card-0 snd-es18xx
    options snd-es18xx index=0 enable=1 isapnp=0 port=0x220 mpu_port=0x388 fm_port=0x330 irq=5 dma1=1 dma2=0

    alias char-major-14 soundcore
    alias sound-slot-0 snd-card-0

    alias sound-service-0-0 snd-mixer-oss
    alias sound-service-0-1 snd-seq-oss
    alias sound-service-0-3 snd-pcm-oss
    alias sound-service-0-8 snd-seq-oss
    alias sound-service-0-12 snd-pcm-oss

In particular the following line looked useful:

    options snd-es18xx index=0 enable=1 isapnp=0 port=0x220 mpu_port=0x388 fm_port=0x330 irq=5 dma1=1 dma2=0

Still in the client console I typed:

    # modprobe snd-es18xx index=0 enable=1 isapnp=0 port=0x220 mpu_port=0x388 fm_port=0x330 irq=5 dma1=1 dma2=0

And the sound module loaded fine.  I then ran:

    # speaker-test
    speaker-test 1.0.13
    Playback device is default
    Stream parameters are 48000Hz, S16_LE, 1 channels
    Using 16 octaves of pink noise
    ...

And sound was working fine.

## LTS.conf

So obviously all we need to do is to set in LTS.conf and we should be sorted:

    SMODULE_01         = "snd-es18xx index=0 enable=1 isapnp=0 port=0x220 mpu_port=0x388 fm_port=0x330 irq=5 dma1=1 dma2=0"

But no joy!  Thinking that the issue was with an incompatibility with one of the above switches and LTSP, I experimented with removing all the switches and just adding some back; the aim being to end up with a minimal set of switches that worked.  On a hunch I tried:

    # modprobe snd-es18xx isapnp=0

And the speaker-test worked.  Adding this to LTS.conf

    SMODULE_01         = "snd-es18xx isapnp=0"

And it *still* didn't work.  For some reason, that I cannot find documented, SMODULE is no longer working, and needs replacing with MODULE - thus:

    MODULE_01         = "snd-es18xx isapnp=0"

All now working.
