---
layout: page
title: Howto | Debug Debian Sound
menu: howto
weight: 40
category: technology
tags: [linux, debian, sound]
---

## Debug Debian Sound

### Warning

Sound is one of those things in Linux which either works out-of-the-box, or drives you berserk. The following instructions did not solve my problems, but I leave them here for future reference.

### References

The gospel for sound according to Debian:

   * http://www.debianhelp.co.uk/sound.htm

### Step 1: Make sure you have the sound system fully installed

    # apt-get install alsa-base alsa-oss alsa-source alsa-utils
    # apt-get install alsamixergui alsaplayer alsaplayer-common alsaplayer-gtk alsaplayer-jack
    # apt-get install alsaplayer-oss snd-gtk-alsa vlc-plugin-alsa alsaplayer-jack jack jackd

### Step 2: Determine your sound card

    # lspci -v | grep -A 6 Audio
    00:14.2 Audio device: ATI Technologies Inc SB600 Azalia
            Subsystem: Micro-Star International Co., Ltd. Unknown device 7297
            Flags: bus master, slow devsel, latency 64, IRQ 22
            Memory at fe020000 (64-bit, non-prefetchable) [size=16K]
            Capabilities: [50] Power Management version 2

### Step 3: Run module-assistant

    # apt-get install module-assistant
    # module-assistant

If this fails stating cannot find `config.h`, then:

    # cd /usr/src/linux-headers/linux-headers-2.6.21-2-k7/include/linux
    # ln -s autoconf.h config.h

Next run:

    # alsaconf

The solution to the problem is often as simple as adding a line at the end of `/etc/modprobe.d/alsa-base` along the lines of:

    $ options snd-hda-intel model=xyz

To determine sound chip model:

    # aplay -l
    **** List of PLAYBACK Hardware Devices ****
    card 0: SB [HDA ATI SB], device 0: ALC861VD Analog [ALC861VD Analog]
    Subdevices: 1/1
    Subdevice #0: subdevice #0

    # cat /proc/asound/cards
    0 [SB             ]: HDA-Intel - HDA ATI SB
                        HDA ATI SB at 0xfe020000 irq 22

Then gunzip `/usr/share/doc/alsa-base/driver/ALSA-Configuration.txt.gz`. Open with nano and search for your soundcard chip as shown above.

`options snd-hda-intel model=3stack` works for many motherboard integrated chips with shared surrounds. Sometimes it is also possible to use the more generic `options snd-hda-intel model=ref`, which the hda driver uses to load manufacturer specfic presets (SigmaTel, Realtek, etc.). The full list is available in ALSA-Configuration.txt in the driver tarball under alsa-kernel/Documentation/.

### Restart sound system

    # cd /etc/init.d
    # then ./alsasound restart

### Play Test Sound

    # locate *.wav
    /usr/share/sounds/KDE_Beep_RingRing.wav
    /usr/share/sounds/KDE_Beep_ShortBeep.wav

    # aplay /usr/share/sounds/KDE_Beep_RingRing.wav
    Playing WAVE '/usr/share/sounds/KDE_Beep_RingRing.wav' : Unsigned 8 bit, Rate 22254 Hz, Mono

### External references

   * http://www.debianhelp.co.uk/sound.htm
   * http://ubuntuforums.org/showthread.php?t=205449
   * http://bugs.archlinux.org/task/6978
   * http://ubuntuforums.org/showthread.php?t=314383
   * http://ubuntuforums.org/showthread.php?p=3267595
   * https://wiki.ubuntu.com/LaptopTestingTeam/Lenovo3000C200_89224MG
   * https://bugs.launchpad.net/ubuntu/+source/linux-source-2.6.20/+bug/107821
   * https://help.ubuntu.com/community/HdaIntelSoundHowto
   * https://bugs.launchpad.net/ubuntu/+source/linux-source-2.6.17/+bug/85869
