---
layout: page
title: "LTSP | LTSP5 Upgrade"
menu: ltsp
weight: 10
category: technology
tags: [ltsp]
---

## LTSP5 Upgrade

### Warning

This page seems a little outdated, most importantly it refers to the LTSP Backports repository, which is now obsolete.  You should instead visit http://backports.org/ and add the Debian Lenny repository.  All references to alioth.debian.org are redundant.  You are probably best off going to this page:

   * http://wiki.debian.org/LTSP/Howto

### Terms of Reference

This is a guide to upgrading from Debian Etch and LTSP 4.2 to Debian Etch and LTSP 5.  This is largely based on the following page which should be your primary guidance on installation:

   * http://wiki.debian.org/LTSP/Howto

Now that Debian Lenny has become the stable release, you should install that instead, see the above document for guidance, and/or my LTSP5 Install page.

### Back-up /opt/ltsp

This will copy your entire `/opt/ltsp` to `/opt/ltsp42`.

    # cd /opt
    # mkdir ltsp42
    # cd ltsp
    # tar cf - * | (cd /opt/ltsp42; tar xfp - )

### Backup other configurations

    # cd /opt/ltsp42
    # mkdir conf
    # cp /etc/ltsp.conf /opt/ltsp42/conf/
    # cp /etc/ltsp-localdev.conf /opt/ltsp42/conf/
    # cp /etc/dhcp3/dhcpd.conf /opt/ltsp42/conf/

**This list is not exhaustive - if you can think of any other configurations outside of `/opt/ltsp` - back them up!**

### Backup tftpboot

    # cd /opt/ltsp42
    # mkdir tftpboot
    # cd /tftpboot
    # tar cf - * | (cd /opt/ltsp42/tftpboot; tar xfp - )

### Remove lbe if installed

    # cd /usr/local
    # rm -r lbe

### Add Backports Repository

**This section is outdated - the latest packages are simply in Debian Backports for Lenny.**

Given that you have chosen to upgrade to LTSP5, it is probably that you want to have the new technologies, which are currently only available in Backports.  If you already have Backports listed in `/etc/apt/sources.list` then you may skip this stage.

#### Add the key(s) for the repository to your keyring(after verifying that you trust them)

    # wget http://pkg-ltsp.alioth.debian.org/debian/pkg-ltsp-keyring
    # apt-key add pkg-ltsp-keyring 

#### Add to /etc/apt/sources.list

    deb http://pkg-ltsp.alioth.debian.org/debian etch-ltsp-backports main

#### Configure pinning in /etc/apt/preferences

If you do not have a preferences file, then an example one might be:

    Package: ltsp-server
    Pin: origin pkg-ltsp.alioth.debian.org
    Pin-Priority: 998

    Package: ltsp-server-standalone
    Pin: origin pkg-ltsp.alioth.debian.org
    Pin-Priority: 998

    Package: ltspfs
    Pin: origin pkg-ltsp.alioth.debian.org
    Pin-Priority: 998

    Package: *
    Pin: release o=Debian,a=stable
    Pin-Priority: 900

    Package: *
    Pin: origin www.backports.org
    Pin-Priority: 700

    Package: *
    Pin: release o=Debian,a=testing
    Pin-Priority: 500

    Package: *
    Pin: release o=Debian,a=unstable
    Pin-Priority: 300

    Package: *
    Pin: release o=Debian
    Pin-Priority: -1

#### Apt-get Update:

    # apt-get update


### How you are logged in?

You should be logged in either directly to the console, or via ssh (or perhaps FreeNX).  If you are logged in from an LTSP Client, then there is a likelihood that your client will be terminated during installation.

The same clearly applies to your users.  In any case some of these processes are CPU intensive (e.g. ltsp-build-client) and it's a good idea to have everyone off the system (this may even be a necessity). 

### Remove Old LTSP Packages

    # apt-get --purge remove ltsp-utils atftpd
    # cd /opt
    # rm -r ltsp

### Install new packages

    # apt-get -t 'etch-ltsp-backports' install ltsp-server-standalone ltsp-server
    # dpkg -l ltsp-server | awk '/^ii/{print $2" "$3}'

**Make sure the version ltsp-server is 5.0.40~ or greater.**

### Build the LTSP client environment

**The ltsp-build-client script needs a lot of time if you have an older server.**

    #  ltsp-build-client --extra-mirror "http://pkg-ltsp.alioth.debian.org/debian etch-ltsp-backports main" --apt-key /etc/apt/trusted.gpg

**Don't be tempted to use a simple ltsp-build-client command, as you need to specify backports repository (as shown above).**

The ltsp-build-client command will download a complete Debian filesystem into `/opt/ltsp/i386` (or specify an alternate location with '--base') and install the ltsp-client and ldm packages (the LTSP Display Manager).

The 2 ltsp configuration files inside the client are `/etc/lts.conf` and `/etc/default/ltsp-client-setup`. See the examples in `/usr/share/doc/ltsp-client*`. Also see the [Edubuntu wiki](http://doc.ubuntu.com/edubuntu/edubuntu/handbook/C/customizing-thin-client.html).

**Debian LTSP still uses NFS by default.**

**If you change the IP data after you have done the initial setup and run ltsp-update-sshkeys on the server.**

The files the client will boot are installed on the server into `/var/lib/tftpboot`, unlike LTSP4.2 which installed in `/tftpboot`.

### Configure DHCP Server

Edit `/etc/dhcp3/dhcpd.conf`.

As you already had DHCP working, under LTSP4.2, then it will just need some modification.  In order to configure your dhcpd.conf, you should refer to examples in `/usr/share/doc/ltsp-server/examples/dhcpd.conf` or `/etc/ltsp/dhcpd.conf` and adjust for your network.

Specifically, you need to make the following changes:

#### Root Path

Take the IP address out of your root-path statement as LTSP5 doesn't support that style of root-path

    option root-path  "/opt/ltsp/i386";

#### Filename

Change the filename entries to:

    filename   "/ltsp/i386/pxelinux.0";

#### Next Server

Etch is still affected by: http://bugs.debian.org/416868 so you need to add this line if the dhcp server and tftp server are the same:

    next-server ip.address.of.server;

#### Restart dhcp3-server

    # /etc/init.d/dhcp3-server restart

Watch for errors, if it will not restart then correct errors and try again.

### Configure Exports

Edit `/etc/exports` to include the following line:

    /opt/ltsp *(ro,no_root_squash,async,no_subtree_check)

Then restart the NFS Kernel Server:

    # /etc/init.d/nfs-kernel-server restart

### Start tftpd

By default, tftpd-hpa is started from inetd, so you may need to restart inetd after installing tftpd-hpa.

    # /etc/init.d/openbsd-inetd restart

Alternately, edit `/etc/default/tftpd-hpa` to have tftpd-hpa start on it's own.

    RUN_DAEMON="yes"

And then restart with:

    # /etc/init.d/tftpd-hpa restart

### Test boot a client

Boot a PXE or Etherboot capable machine and enjoy!

### Changing the Client

See the following page for details:  http://doc.ubuntu.com/edubuntu/edubuntu/handbook/C/customizing-thin-client.html

    # sudo chroot /opt/ltsp/i386
    # apt-get install rdesktop
    # sudo ltsp-update-image

### Setting root password for client

Screen scripts are how LTSP determines what type of login will run on what virtual screen. Most GNU/Linux machines have 12 virtual consoles, which you can access by pressing Control-Alt-F1, through Control-Alt-F12. There is a text based getty that is started on screen 1, but you normally can't log into it, as there are no local users on the thin client.

However, for debugging purposes, you may want to set up root to log in on the thin client. You may need to do this if you're debugging problems with local devices, for example. Fortunately, it's easy to do: on the server, just chroot into the LTSP chroot, and set the password with passwd.

    sudo chroot /opt/ltsp/i386
    passwd

### Further information

   * [LTSP5 Sound](/ltsp/ltsp5-sound/)
   * [LTSP5 Local Devices](/ltsp/ltsp5-local-devices/)
   * [LTSP5 Workarounds](/ltsp/ltsp5-workarounds/)

### References

   * http://wiki.debian.org/LTSP/Howto
      * http://doc.ubuntu.com/edubuntu/edubuntu/handbook/C/customizing-thin-client.html
   * http://www.mail-archive.com/ltsp-discuss@lists.sourceforge.net/msg33415.html
   * http://www.linuxagora.com/vbforum/showthread.php?t=749
   * http://www.ltsp.org/twiki/bin/view/Ltsp/Debian#LTSP_5
   * http://marc.info/?l=ltsp-discuss&w=2&r=1&s=ltsp5+debian+etch&q=b

