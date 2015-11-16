--- 
layout: post 
title: Problems Playing Silverlight Media On Windows Server 2003
date: 2011-03-03
type: post 
published: true 
status: publish
category: technology
tags: [linux, windows, silverlight, rdp]
image: silverlight.jpg
---

We have to be able to play Silverlight media on our two virtual Windows
Server 2003 servers.  This is completely unavoidable, because you first
need to authenticate via an Active-X website, so any option of using
Moonlight on Linux was impossible.

The problem that we had was that when we clicked on the Play Media
button, there were two pop ups stating *"This page has an unspecified potential security risk"* followed by another stating *"A problem was encountered with the media file specified."*

<!--more-->

I tried bypassing our proxy server;  I ensured that the Internet
Enhanced Security was uninstalled; I tried adding the relevant sites to
"Trusted sites"; I tried reducing Trusted Sites to "Low" security; I
brought all the critical updates up-to-date.  Nothing seemed to make a
difference.

Finally, I decided to review the optional Windows updates, just to see
if there was anything related to Silverlight and noticed that there was
a major update to .net available ".NET framework 4". Knowing that
Silverlight is a .net technology, I installed it and, after yet another
reboot, the pop ups had gone and it was working.

My reason for writing about it is simply this:  I had googled endlessly
about this problem, without any success, there was seemingly nothing
relevant to this problem.  Hopefully this post will help others.

But you should be using Linux not Windows!  There, couldn't resist ;)

