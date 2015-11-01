---
layout: page
title: "LTSP | LTSP4.2 Client Sound"
menu: ltsp
weight: 10
---

## LTSP4.2 Client Sound

### Step 1 - Switch on sound

Firstly, you need to switch sound on for the clients.

    # File: /opt/ltsp/i386/etc/lts.conf
    #
    # enable sound by default
    SOUND                   = Y
    # choose either esd or nasd to be the default (esd only on x86_64)
    SOUND_DAEMON            = esd
    VOLUME                  = 100 # Speaker & WAVE volume pecentage
    MIC_VOLUME              = 100 # Microphone volume
    CD_VOLUME               = 75  # CD Audio volume

### Step 2 - Identify soundcard

To determine what Soundcard is installed in your PC, add the line:

    # File: /opt/ltsp/i386/etc/lts.conf
    #
    SCREEN_02          = shell

Then enter after rebooting, enter shell by typing Ctrl+Alt+F2. In the shell, to show any PCI Soundcards, type:

    # lspci -v | more

Look for a device stating "audio" and make a note of the salient details. For example my test PC has the following details:

Intel 82801EB/ER AC97 IRQ5 IO Port d400 @ 256k and d800 @ 64k.

### Step 3 - Check LTSP.org

Check the following website - you might strike lucky!

   * http://wiki.ltsp.org/twiki/bin/view/Ltsp/SoundCards

### Step 4 - Determine appropriate driver

To decide the appropriate driver to use, typing the following command on the server or functioning client, will give you a list of available drivers:

    $ find /opt/ltsp/i386/lib/modules/ | grep snd

### Step 5 - Identify sound module with Knoppix

Boot the client with Knoppix and from a terminal window type "lsmod" to identify the sound module.

### Step 6 - Trial and error

At this point it's probably worth removing, or commenting out the sound options, so that the client boots without any sound modules loaded. Once booted key Ctrl+Alt+F2.

Unless you have a good knowledge of sound drives, this is going to be a little bit of trial and error - remember Google is your friend. In this instance I Googled for "LTSP Intel 82801EB" and found a page detailing the following:

 >> Intel Corp. 82801EB/ER (ICH5/ICH5R) AC'97 Audio Controller
 >
 > lsmod | grep -i intel
 >
 > snd_intel8x0m 20036 1

I compared this with the output from Step 4 and decided the best match was "snd-intel8x0".

    # modprobe snd-intel8x0

The command responded with some clean output. I therefore added the following to LTS.CONF:

    SMODULE_01         = "snd-intel8x0"

And success!

A common Soundblaster compatible card is:

    # File: /opt/ltsp/i386/etc/lts.conf
    #
    SMODULE_01 = "sb io=0x220 irq=5 dma=1"

### Other issues

#### Soundcard okay but no sound

If you are confident that the soundcard is being identified correctly and there are no errors on boot-up, then perhaps the volume is muted. The only volume controls at our disposal are:

    VOLUME                  = 100 # Speaker & WAVE volume pecentage
    MIC_VOLUME              = 100 # Microphone volume
    CD_VOLUME               = 75  # CD Audio volume

However from a client shell you can try the following:

    $ cd /share/sounds/alsa
    $ esdplay Noise.wav
    $ amixer scontrols              # Take a note of them
    $ amixer sget Front             # To view each control
    $ amixer sset Front 75% unmute   # To set a control called Front to 75% volume

### snd-hda-intel issues

Oh, so may issues. Try each of the following in `lts.conf`:

**Google for ALSA-Configuration.txt and review section on snd-hda-intel.**

    SMODULE_01              = "snd-hda-intel model=auto"
    SMODULE_01              = "snd-hda-intel model=3stack"
    SMODULE_01              = "snd-hda-intel model=3stack-dig"
    SMODULE_01              = "snd-hda-intel index=0 probe_mask=3 position_fix=3"
    SMODULE_01              = "snd-hda-intel position_fix=1 model=3stack"

### Sound muted

All working but sound muted. Save this script as "unmute" in `/opt/ltsp/i386/etc/rc.d`:

    #!/bin/bash
    #
    # Copyright Gideon Romm, Symbio Technologies
    #
    # Released under GPLv2
    #
    # This is a script to set up certain things 
    # that are not already setup in an SBA environment
    #
    # Specifically:
    #   1. restore sound levels
    #

    # Set up local environment
    if [ -f /etc/lts.conf ]; then
        eval `getltscfg -a`
    fi

    # Set up sound
    if [ -n "$VOLUME" ]; then
        amixer sset Master,0 ${VOLUME}% unmute 2>/dev/null
        amixer sset 'Master Digital',0 ${VOLUME}% unmute 2>/dev/null
        amixer sset Headphone,0 ${HEADPHONE_VOLUME:-$VOLUME}% unmute 2>/dev/null
    fi

    if [ -n "$PCM_VOLUME" ]; then
        amixer sset PCM,0 ${PCM_VOLUME}% unmute 2>/dev/null
    fi

    if [ -n "$MIC_VOLUME" ]; then
        amixer sset Mic,0 ${MIC_VOLUME}% unmute cap 2>/dev/null
    fi

    if [ -n "$CD_VOLUME" ]; then
        amixer sset CD,0 ${CD_VOLUME}% unmute 2>/dev/null
    fi

    if [ -n "$FRONT_VOLUME" ]; then
        amixer sset Front,0 ${FRONT_VOLUME}% unmute 2>/dev/null
    fi

Then add the following line to LTS.conf:

    RCFILE_01          = unmute

This unmute script also adds the functionality of FRONT_VOLUME, which may be set in LTS.CONF:

    FRONT_VOLUME       = 100

The script could be easily modified to enable other volume controls is required.
