---
layout: page
title: "LTSP | LTSP5 Sound"
menu: ltsp
weight: 10
category: technology
tags: [ltsp]
---

## LTSP5 Sound

### Introduction

One of the many benefits of LTSP5 is that it does away with the need for ESD sound (or other hacks), and instead utilises Pulseaudio on the client and Alsa on the server.

The rest of this document is largely based on the following Ubuntu/Gnome instructions:

   * http://developer.novell.com/wiki/index.php/Feisty/HOWTO:_PulseAudio

Those instruction now state that they are obsolete for new versions of Ubuntu; however they still seem to be required for Debian Lenny.

### Install packages on server

    $ sudo apt-get install pulseaudio liboil0.3 pulseaudio-utils libpulse-browse0 libpulse-mainloop-glib0 padevchooser pulseaudio-esound-compat
    $ sudo apt-get install libao-pulse (for etch)
    $ sudo apt-get install libao2 (for lenny)
    $ sudo apt-get install alsa-base alsa-utils libasound2-plugins

### Install packages on client

I believe that these packages are already installed in Lenny, but no harm in checking:

    $ sudo chroot /opt/ltsp/i386/
    # apt-get install pulseaudio pulseaudio-esound-compat pulseaudio-module-x11
    # exit

### ALSA configuration 

On the server, configure ALSA to forward audio to PulseAudio by creating a file `/etc/asound.conf` with the following:

    pcm.!default {
            type pulse
    }

    ctl.!default {
            type pulse
    }

### PulseAudio configuration

Configure the PulseAudio daemon, create `/opt/ltsp/i386/etc/pulse/daemon.conf` as follows:

    daemonize = 1
    high-priority = 1
    log-target = stderr
    resample-method = trivial
    no-cpu-limit = 1
    system-instance = 1
    disable-shm = 1

### Conclusion

In my experience there is no need to reboot the server, in KDE I just restarted the sound system by switching sound off and back on in the KDE Control Panel, and clicked Test button.  I could probably just have logged off/on.

### References

   * http://developer.novell.com/wiki/index.php/Feisty/HOWTO:_PulseAudio

