--- 
layout: post 
title: Choppy Audio Silverlight Over RDP
date: 2011-03-04
type: post 
published: true 
status: publish
category: technology
tags: [linux, windows, silverlight, rdp]
---

<img src="/assets/silverlight.jpg" class="image-right" alt="Silverlight logo">

Following [my recent post]({% post_url 2011-03-03-problems-playing-silverlight-media-on-windows-server-2003 %})
regarding Silverlight, unfortunately I have hit disaster.  When the
audio starts, it sounds choppy with a double-echo or reverb.  In short
it is unusable.  All other audio works fine, even on the same webpage,
but as soon as you try and listen to a Silverlight widget it sounds
terrible.

<!--more-->

Googling "silverlight rdp choppy" in desperation has not filled me with
confidence, there are a number of posts including:

  * [Has anyone else ran into a problem where if you use a Silverlight app over Remote Desktop and it plays a WMA or MP3 file using MediaElement, the sound is choppy?](http://forums.silverlight.net/forums/p/94280/303052.aspx)

It is possible that upgrading to Windows Server 2008 would resolve this
issue; although there are issues I believe in connecting to the latest
RDP version using rdesktop.

I did find [this advice from Microsoft](http://social.technet.microsoft.com/Forums/en-US/winserverhyperv/thread/1e7a9764-e220-4693-a4ac-d7f4e811283b),
the Microsoft RDP Client was the only sound card available, but I
followed the advice anyway to no avail.

What I simply do not understand is why all other audio works perfectly
via RDP, except Silverlight, especially given the fact that Silverlight
and RDP are Microsoft products.

Any suggestions gratefully received!

