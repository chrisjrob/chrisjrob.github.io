---
layout: post
title: Howto | Fix Kiosktool Fish Protocol Stalls
menu: howto
date: 2010-09-29 10:05:41
weight: 40
category: technology
tags: [howto, linux, kde, kiosktool]
---

## The Issue

When making changes to profiles under kiosktool, it stalls when uploading changes to the local machine using the fish protocol, see screenshots.

Persistently clicking cancel followed by retry does deliver the goods, but sometimes it can take ten attempts or more, with the load average quickly escalating to ten times the server's usual level.

<!--more-->

I understand it requires the fish protocol, even though it is editing the local machine, because kiosk has to be run as a standard user, but requires root access to edit the profile.

The fish protocol usually works fine in konqueror.

Under our Kiosk configuration I have the base directory set as `/etc/kde-profile` and the option "On exit, upload profiles to a remote server" is unchecked.

## Screenshots

<img src="/assets/kiosk_1.gif">
<img src="/assets/kiosk_2.gif">
<img src="/assets/kiosk_3.gif">

## Workaround

Keep cancelling the copy and then retry.

**Never come out without successfully completing the copy, or you can end up with corruption in your personal desktop, or menus, or even end up unable to log in.  You have been warned.**

## The Solution

The solution seems to be to edit the menu entry for Kiosk-Tool and change it to:

    env KDE_FORK_SLAVES=true kiosktool

## References

   * http://lists.kde.org/?t=111633283900002&r=1&w=2 (Similar problem under SUSE)
   * http://bugs.kde.org/show_bug.cgi?id=8137 (similar problem under FreeBSD)
