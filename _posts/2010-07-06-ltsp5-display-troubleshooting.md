---
layout: post
title: "LTSP | LTSP5 Display Troubleshooting"
menu: ltsp
date: 2010-07-06 09:50:08
weight: 10
category: technology
tags: [ltsp, xorg]
---

<img src="/assets/ltsp_logo.png" class="image-right" alt="LTSP Logo">

## Warning

This is currently a few scrappy notes just to jog my memory as to things to try.  Messing about with monitor settings can blow your monitor, graphics card and probably both; although in practice sensible use should ensure that never happens to you.

Note that some of these commands may not exist on your system, if you need to install them, then remember to install into the chroot, e.g.:

<!--more-->

    # chroot /opt/ltsp/i386
    # apt-get update
    # apt-get install lshw
    # exit

Erm, suppose I should mention this whole page was tested on Debian Lenny.

## Cables

Do consider trying a new monitor cable - as a poor quality or damaged cable can cause problems that are difficult to trace.  A few seconds to try a different cable might save you endless time.

## A word about drivers

There are often multiple drivers for a particular graphics card, for example with nvidia cards you can sometimes use the opensource "nv" driver and sometimes the proprietary "nvidia" driver, and I believe there is a "nouveau" driver, which I have not yet experienced.  Similarly in intel, stipulating that the driver should be "intel" may solve your problem.  See lspci below for details.

## X Authority

All of the following commands were run from an ssh session to the thin client itself, for this to work you need to install openssh-server in the chroot.  Alternatively you can simply go to the client and type ctrl-alt-f1 to access to the client's console and type the following commands from there.  Obviously the benefit to the ssh approach is that you can do it remotely and cut and paste from your browser into the client.

We need to be able to access the xserver from the console, so we need to set the XAUTHORITY:

    # export XAUTHORITY=`find /var/run -name Xauthority`
    # echo $XAUTHORITY
    /var/run/ldm-xauth-qOQkpTdNp/Xauthority
    # export DISPLAY=:7
    #

## Useful Programs

### lspci

In order to google your problems, you'll need to know the make and model of your graphics card, to find this out, run the lspci command:

    # lspci
    # lspci -v | more

The first command is a summary, the second command gives you more information.  The "VGA compatible controller" is probably for what you're looking.

### lshw

List Hardware will list all the hardware on your PC.

    # lshw -C display

### getltscfg

Report all the settings from lts.conf which apply to this terminal.  This helps diagnose those occasions where the client is refusing to obey your lts.conf commands.

    # getltscfg -a

### xvidtune

xvidtune -show will report the current monitor settings as a modeline:

    # xvidtune -show

You can also run xvidtune as a localapp when logged into the thin client:

    "/usr/bin/ltsp-localapps xvidtune"

### xdpyinfo

xdpyinfo reports a great many details from the xserver, including resolution, colour depth etc:

    # xdpyinfo | more

### gtf cvt

There are two tools for creating a modeline - gtf and cvt.  My understanding is that cvt is the newer tool, in use from 2003, but tbh I really don't know which you should use.  Both tools work in the same way.  Some examples:

    # gtf 1920 1080 60
    # cvt 1280 1024 75

### xrandr

To save rebooting endlessly you can test monitor settings on the fly with xrandr:

    # xrandr
    # xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync
    # xrandr --addmode VGA "1920x1080_60.00"
    # xrandr --output VGA --mode "1920x1080_60.00"
    # xrandr --auto

The first command provides you with useful information about your xserver, including the available modes, and most importantly the available "outputs" (these are your monitors/displays); in the above example my only output is a monitor called "VGA".  newmode creates the newmode (e.g. as output by gtf or cvt), addmode makes that mode applicable to the output, and the next command activates that mode.  The final command "auto" will reset your display automatically, probably your previous settings.

## References

For once almost all of this was my own work, and so all my fault ;).  That said the following page was helpful to me in the section about xrandr:

   * https://wiki.ubuntu.com/X/Config/Resolution
