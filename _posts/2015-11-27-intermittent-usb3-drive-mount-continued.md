--- 
layout: post 
title: Intermittent USB3 Drive Mount Continued
date: 2015-11-27 12:10:00
type: post 
category: technology
tags: [linux,ubuntu,usb,drive]
image: anker-usb3-hub.jpg
---

Further to my recent post [Intermittent USB3 Drive Mount], sadly I have to report that, after ten days of perfect operation, this morning once again the drive mount failed.

    # dmesg | tail

<!--more-->

    [ 7659.848351] usb 2-3: Product: USB3.0 Hub             
    [ 7659.848352] usb 2-3: Manufacturer: VIA Labs, Inc.         
    [ 7659.852937] usb 2-3: Disable of device-initiated U1 failed.
    [ 7659.856435] usb 2-3: Disable of device-initiated U2 failed.
    [ 7659.856473] hub 2-3:1.0: USB hub found
    [ 7664.860293] hub 2-3:1.0: config failed, can't read hub descriptor (err -22)
    [ 7664.863787] usb 2-3: Set SEL for device-initiated U1 failed.
    [ 7664.867279] usb 2-3: Set SEL for device-initiated U2 failed.
    [ 8137.312105] usb 2-3: reset SuperSpeed USB device number 3 using xhci_hcd
    [ 8137.559139] xhci_hcd 0000:00:14.0: xHCI xhci_drop_endpoint called with disabled ep ffff8800bc7e8a20

## Power Control

Following the tack from last time, I once again checked the USB power control status:

    # grep . /sys/bus/usb/devices/*/power/control

As before these were mostly set to auto, so I switched on again using the same command as before:

    # for F in /sys/bus/usb/devices/*/power/control; do echo on >"${F}"; done
    # grep . /sys/bus/usb/devices/*/power/control

Clearly I need a more permanent fix to that command.


## Auto-Suspend

I also discovered two more settings:

    # grep . /sys/bus/usb/devices/*/power/autosuspend

Apparently to switch off auto-suspend you should set the delay seconds to -1:

    # for F in /sys/bus/usb/devices/*/power/autosuspend; do echo -1 >"${F}"; done
    # grep . /sys/bus/usb/devices/*/power/autosuspend

To set this permanently I created a file `/etc/modprobe.d/autosuspend.conf`:

    options usbcore autosuspend=-1

I came across [Ubuntu Bug 1371233], in which there was a suggestion to try:

    # echo -1 >/sys/module/usbcore/parameters/autosuspend

And on the same lines the suggestion to edit `/etc/default/grub` file and append to the `GRUB_CMDLINE_LINUX_DEFAULT` line:

    usbcore.autosuspend=-1


## Power Level

You can also check your USB power levels:

    # grep . /sys/bus/usb/devices/*/power/level

Mine were already all switched on, but if not:

    # for F in /sys/bus/usb/devices/*/power/level; do echo on >"${F}"; done
    # grep . /sys/bus/usb/devices/*/power/level


## Back to Basics

Having run through all the above, I still could not see my drive. 
Unplugging and plugging it back in seems to have no reaction in the logs, suggesting that my drive is not being seen at all.

Re-plugging the USB hub seems to respond okay:

    Nov 27 11:51:47 asusi5 kernel: [11372.680605] usb 1-3: USB disconnect, device number 2
    Nov 27 11:51:47 asusi5 kernel: [11372.775937] usb 2-3: USB disconnect, device number 3
    Nov 27 11:51:54 asusi5 kernel: [11379.603869] usb 1-3: new high-speed USB device number 7 using xhci_hcd
    Nov 27 11:51:54 asusi5 kernel: [11379.733470] usb 1-3: New USB device found, idVendor=2109, idProduct=2812
    Nov 27 11:51:54 asusi5 kernel: [11379.733478] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
    Nov 27 11:51:54 asusi5 kernel: [11379.733482] usb 1-3: Product: USB2.0 Hub
    Nov 27 11:51:54 asusi5 kernel: [11379.733486] usb 1-3: Manufacturer: VIA Labs, Inc.
    Nov 27 11:51:54 asusi5 kernel: [11379.734284] hub 1-3:1.0: USB hub found
    Nov 27 11:51:54 asusi5 kernel: [11379.734556] hub 1-3:1.0: 4 ports detected

But still plugging in the USB3 drive into that hub still has no effect. 

Next I tried re-plugging the USB hub into a different USB3 port. 
This time when I plugged back in the USB drive - it was recognised and worked perfectly.


## Conclusions

It could be that one of the above fixes only affects new devices (the auto-suspend probably), and that by choosing a different port it was recognised as a new device and therefore worked.

Equally there could be a hardware problem with the original USB port, perhaps the connector inside the case is a bit dodgy.

For now I will monitor the situation for another week or two and report back.

[Intermittent USB3 Drive Mount]: {% post_url 2015-11-17-intermittent-usb3-drive-mount %}
[Ubuntu Bug 1371233]: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1371233

