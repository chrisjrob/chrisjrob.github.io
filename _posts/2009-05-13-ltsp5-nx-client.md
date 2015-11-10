---
layout: post
title: "LTSP | LTSP5 NX Client"
menu: ltsp
date: 2009-05-13 17:14:37
weight: 10
category: technology
tags: [ltsp, nx]
---

<img src="/assets/ltsp_logo.png" class="image-right" alt="LTSP Logo">

## Instructions

These instructions are for installing NoMachine's NX Client for Linux on LTSP, to enable connection to a FreeNX (or NX) server from a screen script.

<!--more-->

## Warning

These instructions are for Debian Lenny.  They are my notes of what I did, and may contain errors or missed steps.

This assumes you have FreeNX installed somewhere to which to connect.  You might like to see my [Install FreeNX]({% post_url 2010-07-08-install-freenx %}) for details.

## Download NXClient

Visit [NoMachine.com](http://www.nomachine.com/download.php) and download the Debian .deb installation.  Copy the deb file into `/opt/ltsp/i386/root`.

## Install NXClient in chroot

    $ sudo chroot /opt/ltsp/i386
    # cd root
    # apt-get install libaudiofile0
    # dpkg -i nxclient_3.3.0-6_i386.deb (or whatever the name of the file is)
    # exit

## Install OpenBox in chroot

Unfortunately running nxclient restarts X every time that it's about to connect.  The solution is to install a lightweight Window Manager like xfwm4 or openbox.

    $ sudo chroot /opt/ltsp/i386
    # apt-get install openbox
    # exit

## Create User Settings

Easiest way is to install NXClient on the server, and run it to create your settings, then copy your `/home/user/.nx` directory into the chroot.

    $ sudo cp -r /home/userid/.nx /opt/ltsp/i386/home/

Move your `/home/userid/.ssh/known_hosts` file sideways, and connect to any and all freenx servers that you wish to be able to use.  Then copy this file to `/opt/ltsp/i386/home/.ssh/`.

## Edit nx settings

Unfortunately these settings include duff information, change to `/opt/ltsp/i386/home/.nx/config` and edit `nxclient.cfg` file, change the location in the following line to:

    <option key="Personal NX dir" value="/home/.nx" />

## Create Screen Script

Create a new screen script:

    $ sudo nano /opt/ltsp/i386/usr/share/ltsp/screen.d/openbox

And copy the following into it:

```sh
#!/bin/sh

PATH=/bin:$PATH; export PATH
HOME=/home; export HOME

. /usr/share/ltsp/screen-x-common

if [ -x /usr/share/ltsp/xinitrc ]; then
    xinitrc=/usr/share/ltsp/xinitrc
fi

xinit $xinitrc /usr/bin/openbox-session -- ${DISPLAY} vt${TTY} ${X_ARGS} -br >/dev/null
```

This script will make the root user's home directory to be `/home`.  I probably should have set it to `/root`, but when I experimented with that it didn't work correctly, I suspect I should have persevered, but I did not, with the result that I am pointing everything to /home instead.

## Make OpenBox Autostart NXClient

Create the Openbox configuration directory:

    $ sudo mkdir -p /opt/ltsp/i386/home/.config/openbox

Then create a new file `autostart.sh`:

    $ sudo nano /opt/ltsp/i386/home/.config/openbox/autostart.sh

And paste in the following:

    (sleep 2 && /usr/NX/bin/nxclient) &

And make it executable:

    $ sudo chmod a+x /opt/ltsp/i386/home/.config/openbox/autostart.sh

## Update `lts.conf`

In `lts.conf`, on the client you wish to test, just set `SCREEN_07 = openbox`.

## Reboot Client

Reboot client the and test!

## References

None, sadly.  No-one to blame but me.

