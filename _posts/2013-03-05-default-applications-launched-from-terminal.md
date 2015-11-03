--- 
layout: post 
title: Default Applications Launched From Terminal
date: 2013-03-05
type: post 
published: true 
status: publish
category: technology
tags: [linux, cli, pekwm]
---

For some time it has irritated me that launching URLs from my terminal
would always launch Iceweasel/Firefox, rather than my default browser
Chromium. If you're running KDE or Gnome, then I accept that this would
be governed from somewhere in the desktop environment's control panel or
settings, but I run [PekWM](http://www.pekwm.org "PekWM"), and assumed
that setting the default browser in update-alternatives should be
enough:

    # update-alternatives --config x-www-browser

<!--more-->

Unfortunately of course many of the applications that I am using are
native to KDE or Gnome and probably are still respecting their
environment's settings. In the end it was simply a case of editing:

    ~/.local/share/applications/defaults.list

And adding the following lines:

    x-scheme-handler/http=chromium.desktop
    x-scheme-handler/https=chromium.desktop

Now opening links from my terminal is correctly opening a new tab in
Chromium, or running Chromium if it isn't already.

Joy.

