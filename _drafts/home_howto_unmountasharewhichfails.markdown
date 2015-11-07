---
layout: page
title: Howto | Unmount a share which fails
menu: howto
weight: 40
category: technology
tags: [linux]
---

## Unmounting a share fails with error message

Could not unmount <PATH>: Device or resource busy

First of all, check that you do not access any directory or file of the share with any program. If this isn't the case, you might have encountered a problem, that is known but not related to Smb4K. It seems that under certain circumstances (that we could not figure out exactly) kdeinit background processes access files and/or directories of the share and keep them open (KDE < 3.4). Unmounting is not possible unless you send 

    $ kill -HUP PID

to each kdeinit instance that has access to the share or its files. Replace PID by the pid of the kdeinit instance. You can find it out by using e. g. KSysguard.

