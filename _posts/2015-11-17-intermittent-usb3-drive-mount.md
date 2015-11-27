--- 
layout: post 
title: Intermittent USB3 Drive Mount
date: 2015-11-17 14:38:00
type: post 
category: technology
tags: [linux, ubuntu, usb, drive]
image: samsung-drive.jpg
---

I have a problem with a Samsung M3 Portable USB3 external hard drive only working intermittently. 
I use a couple of these for off-site backups for work and so I need them working reliably.
In fairness a reboot does cure the problem, but I hate that as a solution.

To troubleshoot this problem, the first step was to check the system devices:

    # ls -al /dev/disk/by-id

<!--more-->

But only my main two system drives were showing, and not the USB3 drive, which would have been `sdc`, being the third drive (a, b, c).


System Logs
-----------

The next step was to check the system logs:

    # dmesg | tail

This showed no issues at all. Then I checked `syslog`:

    # tail /var/log/syslog

This was completely empty, and had not been written to for almost a year. 
I can't quite believe I haven't needed to check the logs in all that time, but there you are.

I checked that rsyslogd was running and it was as user syslog. But the `/var/log/syslog` file was owned by root with group adm, but whilst syslog was a member of the adm group, the files all had user rw permissions only `-rw-------`.

This was easily fixed:

    # chmod g+rw /var/log/*
    # service rsyslog restart

Now the syslog file was being written to, but there was a problem writing to `/dev/xconsole`:

    Nov 17 12:20:48 asusi5 rsyslogd: [origin software="rsyslogd" swVersion="7.4.4" x-pid="11006" x-info="http://www.rsyslog.com"] start
    Nov 17 12:20:48 asusi5 rsyslogd: rsyslogd's groupid changed to 103
    Nov 17 12:20:48 asusi5 rsyslogd: rsyslogd's userid changed to 101
    Nov 17 12:20:48 asusi5 rsyslogd-2039: Could no open output pipe '/dev/xconsole': No such file or directory [try http://www.rsyslog.com/e/2039 ]
    Nov 17 12:20:48 asusi5 rsyslogd: [origin software="rsyslogd" swVersion="7.4.4" x-pid="11006" x-info="http://www.rsyslog.com"] exiting on signal 15.

So I duly visited [the link mentioned](http://www.rsyslog.com/e/2039), which gave instructions for disabling `/dev/xconsole`, but this made me nervous and further research suggested that that was indeed the correct fix for headless servers, but possibly not for a desktop PC. Instead I used the following fix:

    # mknod -m 640 /dev/xconsole c 1 3
    # chown syslog:adm /dev/xconsole
    # service rsyslog restart


USB Powersaving
---------------

Now at least it seems that my syslog is working correctly. Unfortunately unplugging and plugging in the USB drive still was not writing to the logs! When I plugged in the drive the blue light would flash repeatedly and then switch off. I would have believed that the drive had a fault, if it weren't for the fact that rebooting the PC solves the problem.

Thinking that perhaps this problem was USB3 related, I decided to Google for "USB3 drive not recognised" which found [this post](https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1242321). Except, that post was only relevant when operating on battery power, whereas I am using a plugged in desktop PC.  Clearly that page could not be relevant?  Except that in my notification area there is a battery icon, relating to my Uninterruptible Power Supply. But surely Ubuntu couldn't be treating my UPS as if it were a battery? Could it?

In order to find out the power status of my USB devices I followed the suggestion of typing:

    # grep . /sys/bus/usb/devices/*/power/control

Most were flagged as "on", but a number of devices were flagged as "auto". I decided to try switching them on to see if that made any difference:

    # for F in /sys/bus/usb/devices/*/power/control; do echo on >"${F}"; done
    # grep . /sys/bus/usb/devices/*/power/control

Now all the devices were showing as on. Time to try out the drive again - I unplugged it and plugged it back in again. This time the power light flashed repeatedly and then went solid. 

Unfortunately the drive was still not mounted, but at least it was alive now. What next? Ah yes, I should check the logs to see if they have any new messages, now that the drive is powered and my logs are working:

    # dmesg | tail
    [15243.369812] usb 4-3: reset SuperSpeed USB device number 2 using xhci_hcd
    [15243.616871] xhci_hcd 0000:00:14.0: xHCI xhci_drop_endpoint called with disabled ep ffff880213c71800


Faulty USB-SATA Bridge
----------------------

At last I have something to go on. I searched for that error message, which took me to [this Debian.net page](http://forums.debian.net/viewtopic.php?f=7&t=117061), which suggested:

> Reason is faulthy usb-sata bridge ASM1051 in USB3 drives. It has nothing to do with motherboards.
See this. <https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=a9c54caa456dccba938005f6479892b589975e6a> 
Workaround was made to kernel 3.17-rc5. Now those disks works. Some perfectly and some works but data transfer is not smooth.

Could that be my problem? I checked my current Kernel:

    # uname -r
    3.13.0-68-generic

So yes, it could be. As I cannot read the device yet, I cannot check whether ASM1051 is present in my USB3 drive.

Having uninstalled 34 obsolete kernels and a further 8 newer kernels that weren't in use, I was in a position to install the latest Kernel from Vivid with:

    # apt install linux-generic-lts-vivid

The problem of course is that in order to boot onto the newer Kernel I must reboot, thereby fixing the problem anyway.


And finally
-----------

It would be easy to portray this as clear evidence of the difficulty of running Linux, certainly Samsung will have thoroughly tested their drive on Windows and Mac operating systems. That said such problems are [not unheard of on the more popular operating systems](http://lmgtfy.com/?q=usb3+drive+not+showing+up+\(windows%2C+os-x\)) and debugging such problems is far harder, I would argue, than the above logical steps.

Having rebooted, as expected, the drive worked. I tried running `lshw` to see if ASM1051 was present, but I could not find it. Of course upgrading the Kernel could have fixed the problem anyway.

For the present I will labour under the comforting belief that the problem is fixed and will update this post again when either the problem reoccurs on in a week's time if all is well!

 * Please see [Intermittent USB3 Drive Mount Continued]...

[Intermittent USB3 Drive Mount Continued]: {% post_url 2015-11-27-intermittent-usb3-drive-mount-continued %}
