---
layout: post
title: "LTSP | LTSP5 Client Sound"
menu: ltsp
date: 2009-05-06 16:17:00
weight: 10
category: technology
tags: [ltsp, sound]
---

## Warning

This document is the LTSP 4.2 Client Sound document, which I am in the process of migrating to LTSP 5.  I think it's pretty much there now down to the last step, which may or may not be appropriate for LTSP 5.

## Background

On Ubuntu and Debian sound on the client gets started automatically during boot by default (the distros udev and the alsa scripts will detect your soundcard and start all needed services if a soundcard was detected on your client).  LDM (the default display manager we use in ltsp5) then sets up a virtual ALSA device in the users session during login.  The tunnel ALSA uses as endpoint is set up through LDM by setting the `PULSE_SERVER` variable, it should point to the clients IP at port 4713 (check that by runing "env" in a terminal when logged in).

**The pulse server only runs on the client, it has nothing to do with sound but being the transport endpoint... do not play with any pulse audio on the server, it's all ALSA.**

<!--more-->

## Step 1 - Ensure users are in the audio group

LDM (the default display manager we use in ltsp5) then sets up a virtual ALSA device in the users session during login.  The users that shall use sound need to be in the audio group to have access to the virtual sound device and volume control.

    $ sudo adduser kate audio
    Password: *******
    The user `kate' is already a member of `audio'.

## Step 2 - Switch on sound

You need to switch sound on for the clients, either for all clients by adding to `[default]` group at the top of the `lts.conf` file, or by adding to the specific client in the usual way.

    # File: /opt/ltsp/i386/etc/lts.conf
    #
    [default] 
        SOUND_DAEMON       = pulse
        SOUND              = True

## Step 3 - Check alsa set-up

To check the alsa setup is proper, have a look at `/etc/asound.conf`.  There should be two lines like the following:

    pcm.!default { type pulse }
    ctl.!default { type pulse }

You may also have a file in the user's home directory `.asound.conf`, which should probably be removed in order to default to the global setting?

## Step 4 - Check port

The tunnel ALSA uses as endpoint is set up through LDM by setting the `PULSE_SERVER` variable, it should point to the clients IP at port 4713 (check that by runing "env" in a terminal when logged in).

Open a shell and type:

    $ env | grep PULSE
    PULSE_SERVER=tcp:192.168.0.48:4713
    $

## Step 5 - Identify soundcard

To determine what Soundcard is installed in your PC, key [Ctrl]+[Alt]+[F1] and log in as root.  If you cannot log in, you may need to set the LTSP Client Root Password.

In the shell, to show any PCI Soundcards, type:

    # lspci -v | more

Look for a device stating "audio" and make a note of the salient details.

## Step 5b - Check Sound not Muted

Some soundcards seem to suffer from a problem that they start-up muted.  To test this, whilst logged onto the client type:

    # alsamixer

If for example the main volume is at nil and there is "MM" (Muted left and Muted right) at the bottom of the slider, then pressing M to unmute, and the cursor keys to increase the volume, will resolve the problem.  The only thing is that this fix will be lost next time you boot the client.

See [Unmute Fix]({% post_url 2009-02-17-ltsp5-sound-client-unmute-fix %}) for details on how to permanently cure this problem.

## Step 6 - Identify sound module with Knoppix

Boot the client with Knoppix or another live CD and from a terminal window type `lsmod` to identify the sound module.  Use this information to help you in the next step.

## Step 7 - Determine appropriate driver

To decide the appropriate driver to use, typing the following command on the server or functioning client, will give you a list of available drivers:

    $ find /opt/ltsp/i386/lib/modules/ | grep snd

## Step 8 - Trial and error

At this point it's probably worth removing, or commenting out the sound options, so that the client boots without any sound modules loaded. Once booted key Ctrl+Alt+F1.

Unless you have a good knowledge of sound drives, this is going to be a little bit of trial and error - remember Google is your friend. In this instance I Googled for "LTSP Intel 82801EB" and found a page detailing the following:

 >> Intel Corp. 82801EB/ER (ICH5/ICH5R) AC'97 Audio Controller
 >
 > lsmod | grep -i intel
 >
 > snd_intel8x0m 20036 1

I compared this with the output from Step 4 and decided the best match was `snd-intel8x0`.

    # modprobe snd-intel8x0

The command responded with some clean output. I therefore added the following to LTS.CONF:

    SMODULE_01         = "snd-intel8x0"

And success!

A common Soundblaster compatible card is:

    # File: /opt/ltsp/i386/etc/lts.conf
    #
    SMODULE_01 = "sb io=0x220 irq=5 dma=1"

## Related Pages

   * [LTSP5 Sound Client :: Configure Compaq Deskpro ENSFF]({% post_url 2008-06-21-ltsp-sound-on-compaq-ensff-pcs %})
   * [LTSP5 Sound Client :: Unmute Fix]({% post_url 2009-02-17-ltsp5-sound-client-unmute-fix %})
