---
layout: post
title: "LTSP | LTSP5 Scanning"
menu: ltsp
date: 2009-11-18 12:29:45
weight: 10
category: technology
tags: [ltsp, scan]
---

## Scanning with LTSP 5 in Debian Etch or Lenny

At the time of writing these instructions worked for Etch, but have not been completed for Lenny.

## Introduction

**This is a description for a scanner physically connected to a terminal (not to the server).**

For LTSP scanning to work, you just need to remember that the roles are reversed - that is the client is the scanning server and the server is the scanning client.  With the exception of the fact that you have to chroot to get at the client, the set-up is an ordinary Linux network scanning set-up.

<!--more-->

## Configure client

### Install client packages

You have to be root in the chroot LTSP client environment for the next steps:

    $ sudo chroot /opt/ltsp/i386
    # mount -t proc /proc /proc
    # mount -t sysfs sys /sys
    # apt-get install libexif12 libgphoto2-2 libgphoto2-port0 libieee1284-3 libltdl3 libsane libsane-extras sane-utils
    # umount sys
    # umount /proc

### User 'saned' needs an additional group:

Still in the chroot:

    # usermod -a -G scanner saned

### Modify `/etc/inetd.conf` (Etch)

Still in the chroot, open `/etc/inetd.conf` (e.g. with vi) and add at the end of the file (after '#:OTHER: Other services') this line:

    sane-port stream tcp nowait saned.saned /usr/sbin/saned saned

### Modify `/etc/default/saned` (Lenny)

The problem with this is that it will run for all users, which seems a bit pointless, should be possible to use an ldm rc.d script, but this did not work correctly for me.

Still in the chroot, open `/etc/default/saned` and change `RUN=no` to `RUN=yes`.

On an upgraded server, this was not enough, I also needed to symlink:

    # cd /etc/rc2.d
    # ln -s ../init.d/saned S99saned

### The initial openbsd-inetd links are wrong. (Etch)

Still in the chroot, Delete openbsd-inetd links  with:

    # rm /etc/rc*/*openbsd*

Create new one's:

    # ln -s ../init.d/openbsd-inetd /etc/rc2.d/S20openbsd-inetd
    # ln -s ../init.d/openbsd-inetd /etc/rc3.d/S20openbsd-inetd
    # ln -s ../init.d/openbsd-inetd /etc/rc4.d/S20openbsd-inetd
    # ln -s ../init.d/openbsd-inetd /etc/rc5.d/S20openbsd-inetd
    # ln -s ../init.d/openbsd-inetd /etc/rc0.d/K20openbsd-inetd
    # ln -s ../init.d/openbsd-inetd /etc/rc1.d/K20openbsd-inetd
    # ln -s ../init.d/openbsd-inetd /etc/rc6.d/K20openbsd-inetd

Check if everything is fine:

    # ls -l /etc/rc*/*openbsd*

### Leave chroot

    # exit or [Ctrl]+[d]

## Configure server

### Install server packages

Thanks to the Debian package system it's easy to get almost all software (as root):

    # apt-get install libsane libsane-extras sane-utils

### Set user grants

You have to set the saned group for every scanner user:

    # usermod -a -G saned ~username~

### saned.conf Configuration (client)

Modify the saned.conf file. Put the IP address of your server, e.g.:

    /opt/ltsp/i386/etc/sane.d/saned.conf

    #
    # saned.conf
    #
    # The contents of the saned.conf  file  is  a  list  of  host  names,  IP
    # addresses or IP subnets (CIDR notation) that are permitted to use local
    # SANE devices. IPv6 addresses must be enclosed in brackets,  and  should
    # always  be specified in their compressed form.
    #
    # The hostname matching is not case-sensitive.
    #
    ~serverip~

### net.conf Configuration (client)

Modify the net.conf file. Put the IP addresses & names of your server, scanner terminal; client and localhost here, e.g.:

    /opt/ltsp/i386/etc/sane.d/net.conf

    # This is the net config file.  Each line names a host to attach to.
    # If you list "localhost" then your backends can be accessed either
    # directly or through the net backend.  Going through the net backend
    # may be necessary to access devices that need special privileges.

    localhost
    ~server-ip~
    ~server-hostname~

### Modify the dll.conf (client)

Enable only two lines, one with 'net' and the other one with the name of your (!) scanner backend (for me: snapscan -> works with Epson scanner).

    /opt/ltsp/i386/etc/sane.d/dll.conf

    # enable the next line if you want to allow access through the network:
    net
    snapscan
    #abaton
    #agfafocus
    #apple
    #avision
    #artec
    #artec_eplus48u
    #as6e
    ...

Here you find an overview of supported backends:

   * http://www.sane-project.org/sane-mfgs.html

### Modify dll.conf (server)

Modify dll.conf.  Enable only the line with 'net' (disable all others):

    /etc/sane.d/dll.conf

    # enable the next line if you want to allow access through the network:
    net
    #abaton
    #agfafocus
    #apple
    #avision
    #artec
    #artec_eplus48u
    #as6e
    ...

### Modify net.conf (server)

Modify net.conf.  Put the IP address of your scanner terminal client (!) here, e.g.:

    /etc/sane.d/net.conf

    # This is the net config file.  Each line names a host to attach to.
    # If you list "localhost" then your backends can be accessed either
    # directly or through the net backend.  Going through the net backend
    # may be necessary to access devices that need special privileges.
    ~client-ip~

Alternatively (and better in my opinion) is to script the scanner program, so that it starts with:

    SANE_NET_HOSTS=client-ip
    export SANE_NET_HOSTS
    scanimage > test.pnm

See Alternative Configuration.

## Restart your client terminal

## Restart hplip (Etch only)

    $ sudo /etc/init.d/hplip restart
    Stopping HP Linux Printing and Imaging System: hpiod hpssd.
    Starting HP Linux Printing and Imaging System: hpiod hpssd.

## Test

If it doesn't work - take a look at your syslog.

## Alternative configuration

If your client doesn't have a static ip and hostname (as with the default ltsp set-up), then you can either configure `/etc/dhcp3/dhcpd.conf` to provide you with a static ip and hostname, or use this alternative scanner configuration.

### Step 1: Remove all client references above

Work back through the above configurations, commenting out all references to your client-ip and client-hostname.

### Step 2: Write a script

Here is a simple test script to determine your client, and list your connected scanner:

    SANE_NET_HOSTS=`echo $SSH_CLIENT | cut -d " "  -f 1`
    export SANE_NET_HOSTS
    scanimage -L

You would need to modify this script to do something more useful with scanimage.

## References

   * http://wiki.ltsp.org/twiki/bin/view/Ltsp/Debian#Scanning_with_LTSP_5_in_Debian_E
   * http://wiki.ltsp.org/twiki/bin/view/Ltsp/Scanners
   * http://www.enterprisenetworkingplanet.com/nethub/article.php/%203637076
   * http://www.jumako.de/cms/index.php?option=com_content&task=view&id=26&Itemid=31
