--- 
layout: post 
title: KDE Power Management In Pekwm
date: 2011-03-06
type: post 
published: true 
status: publish
categories: technology linux pekwm
tags: power
---

After my laptop spontaneously switched off on **two** separate
occasions, because I had failed to switch on the mains socket, I decided
that something had to be done about the lack of power management in
[pekwm](http://www.pekwm.org/).

Hunting the 'net for anything to do with pekwm is a frustrating
business. You can't help thinking that there are only a handful of us
that use it. I may post something about why I think pekwm is great, but
that is a topic for another day.

As my laptop's primary desktop environment is KDE, I wanted to use the
KDE power management with pekwm, rather than install the Gnome Power
Manager, which would bring in a load of Gnome dependencies. If you
already have Gnome installed, then I suspect the Gnome Power Manager is
for you.

There seem to be three parts to this:

1.  Getting the power management daemon to run
2.  Adding a power meter
3.  Adding the configuration tool to the menu

Whilst these instructions are primarily for pekwm, I am sure that
openbox, fluxbox and other \*box window managers could use them with a
little adjustment.

Power Management Daemon
-----------------------

In the `~/.pekwm/start` file, add the lines:

    kded4 & qdbus org.kde.kded /kded loadModule powerdevil &

If you do not want to restart pekwm to test, just run those two commands
live.

Battery Meter
-------------

Update: Since writing this post [I have discovered tint2](/2011/03/07/pekwm-with-tint2-panel/) 
which includes a simple battery monitor.

What I really want is a battery level meter that will sit happily in
[Docker](http://icculus.org/openbox/2/docker/), but I failed in this
quest. If you have any suggestions, please do let me know and I will
update this post. In the meantime I have installed xbattbar, which gives
a full thin width line at the bottom of your screen.

    $ sudo apt-get install xbattbar

In the `~/.pekwm/start` file, add the line:

    xbattbar &

Power Management Configuration
------------------------------

It is quite possible that you will wish to configure your power
management from within pekwm. To do this, add the following to your
`~/.pekwm/menu` file:

    Entry = "Configure Powerdevil" { Actions = "Exec kcmshell4 powerdevilconfig & " }

And that appears to be a working solution for me, I hope it works for
you too!

