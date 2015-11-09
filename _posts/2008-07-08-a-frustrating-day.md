---
layout: post
title: "A frustrating day"
date: 2008-07-08 00:00:00
category: technology
tags: [linux, ltsp]
---

Just when I thought I'd got our LTSP server running sweetly, I received a number of complaints from users complaining about poor performance on the Windows applications, in particular Internet Explorer.  It seemed that almost everyone had three or more IE windows open, all for sites that can only be accessed via IE.  Many of the users weren't at their desks, but despite this IE still managed to consume massive amounts of CPU.  The Windows server was topping out and performance was suffering as a result.  I managed to log off a couple of disconnected users, which helped.  Needless to say, blaming Microsoft didn't cut much mustard.

<!--more-->

Then one user, running a simple shell application using kdialog, started seeing kdialog sessions spiralling wildly out of control, in the end we had hundreds, possibly thousands, of kdialogs running.  It transpired that the application was supposed to talk to the user's scanner, but couldn't and therefore kept forking another error message ad infinitum.

So the day ended with two additional items for my to-do list:

   1. Fix scanning
   2. Sort out Windows load

On the plus side I did manage to get somewhere with a long-standing issue of [open multipage tiffs in kde]({% post_url 2009-03-21-open-multipage-tiffs-in-kde %}).

