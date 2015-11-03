--- 
layout: post 
title: Windows 7 Fails To Read An NTFS Drive Twice
date: 2011-03-20
type: post 
published: true 
status: publish
category: technology windows
tags: ntfs
---

My brother-in-law's Buffalo HS-DH500GL NAS (network attached storage)
has failed, it responds to pings, but cannot be accessed via the web
interface, nor by the Windows client software. We reset the device on
multiple occasions, but the reset failed to change the IP address to the
default. We noticed that the rear fan is not working, which suggests
that the device is not in the best of health.

<!--more-->

So we took the drive out of the NAS and I used a 
[USB to SATA cable](http://www.amazon.co.uk/gp/product/B001A5SK56/ref=as_li_ss_tl?ie=UTF8&tag=robsquadnet-21&linkCode=as2&camp=1634&creative=19450&creativeASIN=B001A5SK56)
to mount the drive on my Debian Squeeze laptop. All worked just fine, I
could browse his music and pictures, but there wasn't much I could do to
recover his 200GB of music and pictures; I hadn't brought an external
USB drive with me (note to self:
[buy a second cable](http://www.amazon.co.uk/gp/product/B001A5SK56/ref=as_li_ss_tl?ie=UTF8&tag=robsquadnet-21&linkCode=as2&camp=1634&creative=19450&creativeASIN=B001A5SK56)),
and we were unable to share a Windows directory with my laptop, for the
simple reason that my laptop did not have samba installed, and his
Vodafone 3G broadband was not functioning. Yes, it was one of those
days.

Simple enough, we thought, we would just plug the USB to SATA cable into
his Windows 7 laptop instead. Unfortunately it seems that, despite
working out of the box on Linux, it requires a driver installed under
Windows 7. A driver which I did not have with me, and of course our 3G
connection was still down at this point; so I could not download it
(even if I could track it down).

Fortunately we had a spare SATA desktop PC, with a spare place for a
hard drive. He did not wish to use Linux, so installed Windows 7. We
then plugged in the SATA drive, enabled it in the BIOS, and rebooted.
The drive and its partitions were detected, but not assigned a drive
letter. We went into drive management, but the option to assign a drive
letter was disabled. Clearly there was something adrift with the drive
that was preventing it from being mounted in Windows 7.

What I would then have done was use a Linux live CD to boot onto this
SATA PC, mount both drives and simply copy the data across, but time had
beaten us - they needed to go to his parents, and we had to leave it at
that. He decided to take the drive into work and get one of his
technical people to recover his data onto a fresh drive.

What a frustrating few hours, and it would have been trivial to fix on a
Linux network, firstly because the drive would have just mounted fine
(which it did on my laptop), secondly because I could have trivially
created an NFS share (okay unfair - as it wasn't Windows fault that I
didn't have the samba installed), or thirdly I could just have used dd
with ssh to transfer the drive image to another computer on the network.

Working on a Windows network is like having one arm tied behind your
back. Working on a Windows network without functioning broadband is like
having one arm tied behind your back whilst wearing a blindfold.

I need a beer.

