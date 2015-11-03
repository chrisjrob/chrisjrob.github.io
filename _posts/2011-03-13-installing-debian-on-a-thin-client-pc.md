--- 
layout: post 
title: Installing Debian On A Thin Client Pc
date: 2011-03-13
type: post 
published: true 
status: publish
category: technology linux lug
tags: 
---

This Saturday I attended the [Surrey Linux User Group meeting](http://surrey.lug.org.uk/bab20110312) 
held at [Sirius in Addlestone](http://siriusit.co.uk/). Mike Judd of 
[Akuna Group](http://www.akunagroup.com/) brought along a number of thin client
PCs, along with monitors, keyboards, mice and a switch and set a
challenge for attendees to attempt to install Linux on them.

The thin clients were IGEL thin clients with 1GB RAM and 1GB transcend
flash card. The RAM is plenty for Linux, so the main challenge was
keeping the installation under 1GB, when modern Linux distros are
probably 6gb or so.

<!--more-->

I decided to try installing a minimal version of Debian, running just
the PekWM Window Manager and not much else. This would me the advantage
of the enormous Debian repositories, with all the flexibility that this
provides.

Please note that this is not a howto, in fact I have typed it up a day
later from memory, there are bound to be missing steps in the process,
but hopefully enough to give you the jist of what I did.

The Installation
----------------

As usual with thin clients there was no optical drive, I tried using 
[my fabulous IODD external hard drive](http://linitx.com/viewproduct.php?prodid=12992) 
to serve up a Debian net install image, but it did not seem to work, not sure why as
the BIOS had a USB-CDROM option. So I had to mount the IODD on my laptop
and transfer the image over to a memory key. Fortunately Debian has a
trick up its sleeve - you can now dd ISOs straight onto a memory stick -
how fantastic is that?! The command was something like this (note that
you write to the drive not to a partition - e.g. `/dev/sdb` not
`/dev/sdb1`):

    $ sudo dd if=/mnt/_iso/debian-squeeze-netinst.iso of=/dev/sdX bs=1M

Having set the BIOS to boot first from USB-HDD and next from USB-ZIP (I
can never remember which), I rebooted. Success, I was presented with the
Debian installer, taking the standard installer (non-graphical), I set
the language and keyboard settings and I choose to manually partition
the drive. This was because the guided partitioning reserved 90mb for
swap space, rightly or wrongly I thought this was pretty pointless, and
reduced this to nil. It has to be said that I did have some memory
problems later, and some swap would be advisable.

Towards the end of the Debian installation, it prompted me to select
what type of system I wanted to install, I unchecked all the options, in
order to leave me with a bare Debian system.

The installation finished, I rebooted and removed the USB key.

The Graphical Environment
-------------------------

Once booted I was faced with a text login prompt. Amazing, a full Debian
system at my finger tips. But no-one was going to be very impressed with
that - I needed a graphical environment. A quick "df" showed me that I
had used 500mb of disk space, so I was already very tight for space.

I installed xserver-xorg and pekwm:

    $ sudo apt-get install xserver-xorg pekwm

But when I tried to run "startx" to enter the graphical environment the
command was not found. For this sort of problem you need "apt-file".
apt-file is a wonderful program that enables you to find which package
you need for a known command (or other file).

    $ sudo apt-get install apt-file
    $ sudo apt-file update 
    $ apt-file search bin/startx
    xfce4-utils: /usr/bin/startxfce4 xinit: /usr/bin/startx`

In this instance I wish to know which package includes the file
`bin/startx`. I could just search for "startx", but I will get some
pointless hits, most programs are located in a directory called "bin",
so searching for `bin/startx` will only match bin commands. The output
tells me that the package that I am missing is `xinit`, so a quick
apt-get:

    $ sudo apt-get install xinit

Now I can run pekwm with `startx`.

Configuring pekwm
-----------------

Once into pekwm I was faced with a black screen with a cursor - don't
panic - that is pekwm in its default state. Right-mouse-click and you
will have the pekwm menu. Hmm, Terminal does not work and there are no
applications listed in the menu. Returning to the terminal with
Ctrl+Alt+F1, I typed Ctrl+c to terminate pekwm and installed xterm
(`$ sudo apt-get install xterm`). Running `startx` again and this time
selecting Terminal from the pekwm menu worked and I could continue my
work from with pekwm.

### Debian Menus

To get applications in the menu, we could edit the `~/.pekwm/menu` file
and add the relevant menus. A better solution is to get the standard
Debian menus working. Firstly you should check that they are not already
working for you, if you have an "Applications" item withing you pekwm
menu, and if it is populated with the Debian applications list, then it
is already working. If not, edit the `~/.pekwm/menu` file and look for a
line that looks like this:

    INCLUDE = "debian-menu"

And edit it to read:

    INCLUDE = "/etc/pekwm/debian-menu"

Now select PekWM from the menu and Reload and you should now have a
properly populated Applications menu.

### WWW Browser

Whilst there, add a Web Browser item, for example - see below:

    RootMenu = "Pekwm" {
        Entry = "Terminal" { Actions = "Exec $TERM &" }
        Entry = "Web Browser" { Actions = "Exec x-www-browser &" }

This just tells it to run whatever the default X web browser is, which
we can set later.

Now in a terminal window you should install your preferred browser. I
ended up installing iceweasel, but there may be a better more
lightweight browser that requires fewer dependencies. Feel free to
comment with suggestions.

Once installed, the menu option `Web Browser` that we created earlier
should be working. If not, then just type:

    $ sudo update-alternatives --config x-www-browser

And select iceweasel (or your preferred browser).

### Set desktop background

Now to make the desktop look a little prettier. For my experiment I
downloaded [a desktop wallpaper that I created a while ago](http://kde-look.org/usermanager/search.php?username=chrisjrob&action=contents).
I installed `feh` (`$ sudo apt-get install feh`), and added the
following to the `~/.pekwm/start` file:

    feh --bg-center your-wallpaper.jpg &

### Install tint2 panel

Most people expect a panel, although strictly speaking they are not
required. For this experiment though I think we should have one:

    $ sudo apt-get install tint2

And then add the following to the `~/.pekwm/start` file:

    tint2 &

Conclusions
-----------

Well, I think that was about it. People seemed to be impressed that I
had a complete Debian with a GUI environment. Though it has to be said
that I was down to about 250mb of free space by the end, not even enough
to install OpenOffice.

I forgot all about sound, and had to install alsa
(`$ sudo apt-get install alsa`). As an experiment I installed Flash, and
tried watching You Tube. Not good - without sound You Tube worked fine,
but with sound the picture disappeared. I had no time to fix this before
the end of the session.

I really enjoyed this challenge, but what about the alternatives? Mike
installed [Slitaz](http://www.slitaz.org/en/), which looked gorgeous,
and used well under 200mb in total. I have been impressed with Slitaz
before, and might be a good option for a project like this.

Thanks to Mike for organising the challenge.

