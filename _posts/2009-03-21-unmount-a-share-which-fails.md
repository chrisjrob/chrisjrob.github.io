---
layout: post
title: Howto &#124; Unmount a share which fails
menu: howto
date: 2009-03-21 06:23:50
weight: 40
category: technology
tags: [howto, linux, file]
---

Unmounting a share fails with error message:

    Could not unmount <PATH>: Device or resource busy

First of all, check that you are not accessing any directory or file of the share with any program, or on any screen. 
If this isn't the case, you might have encountered a problem, that is known but not related to Smb4K. It seems that under certain circumstances (that we could not figure out exactly) kdeinit background processes access files and/or directories of the share and keep them open (KDE < 3.4). Unmounting is not possible unless you send...

<!--more-->

    $ kill -HUP PID

... to each kdeinit instance that has access to the share or its files. Replace PID by the pid of the kdeinit instance. You can find it out by using e. g. KSysguard.

