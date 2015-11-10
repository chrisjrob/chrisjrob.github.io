---
layout: post
title: "LTSP | LTSP5 Install"
menu: ltsp
date: 2010-03-30 09:55:14
weight: 10
category: technology
tags: [ltsp]
---

<img src="/assets/ltsp_logo.png" class="image-right" alt="LTSP Logo">

## Introduction

Time to install a new server - yay!  The hardware is an HP Proliant DL360 G5, with a single quad-core processor and 4GB ram.  This page is about creating a complete desktop server and, as such, much of this is actually nothing to do with LTSP, but is all about setting up a functional and attractive desktop server.

## Server Specification

<!--more-->

The following page, which I wrote for LTSP4.2, should largely hold true:

   * [Server Sizing]({% post_url 2010-02-15-ltsp-server-sizing %})

## Server Set-up

Physically install the server and plug the network into a Gigabit port on your network switch and install your disk drives and configure your RAID volume.

## Debian Base Install

Download the netinst ISO from Debian.  Burn the ISO to disk.  Insert the disk into the optical drive of your server and boot.  Follow the installer prompts, until you get to the section on partitioning.

## Partitioning

There is no way that I can tell you what to do here - there are just too many variables - but here is what I did:

In addition to the following, you will need to create a swap partition which should be roughly equal to your RAM.  Opinions do differ on this point, and if you have plenty of RAM, then you should be able to have a much smaller swap partition, perhaps only 1 GB.  For low-memory systems, you should probably create a swap partition that is much larger than your RAM, but expect the performance to suffer as a result!  Server based systems should be given adequate RAM, and the swap should really only be used occasionally.

    Filesystem           1K-blocks      Used Available Use% Mounted on
    /dev/cciss/c0d0p5       885436    150672    689784  18% /
    /dev/cciss/c0d0p1        85528     28829     52283  36% /boot
    /dev/cciss/c0d0p2        85549      5664     75468   7% /rescue
    /dev/cciss/c0d0p6     48062440    184344  45436620   1% /home
    /dev/cciss/c0d0p7     48062440    184324  45436640   1% /opt
    /dev/cciss/c0d0p8     28834716    176200  27193792   1% /srv
    /dev/cciss/c0d0p11     2529920     69384   2332020   3% /tmp
    /dev/cciss/c0d0p9      6728280    293660   6092840   5% /usr
    /dev/cciss/c0d0p10     2885780    256356   2482836  10% /var

With an LTSP system it is sensible to have a separate `/opt` partition; it doesn't need to be as large as this, but I choose to use `/opt` for my virtual machines, 10GB should be adequate.  On servers it is sensible to have separate `/usr`, `/var` and `/tmp` file systems.  The `/srv` is simply going to be for shared documents - so your requirements may be different - perhaps you have a NAS for that purpose.  A separate `/home` is recommended for all systems.  The `/tmp` partition here is HUGE, this is because I will be installing a virtualised Windows server using KVM in snapshot mode, which uses `/tmp` for working files; you should be able to get away with 0.5GB.  Lastly the `/rescue` partition is optional, it should be a mirrored copy of `/boot` and then should be removed from `/etc/fstab`, as a rescue partition.

## Installing Debian

My personal preference is to install a base system only, unchecking even the "Standard system" when prompted.  This leaves you with a perfectly working system on which to build your LTSP server.  Follow the prompts to remove the install CD and reboot.

## Install OpenSSH Server and Screen

These packages make it easy to remotely administer your server, openssh creates the connection, screen enables you to use multiple terminals and to disconnect and reconnect to each ([Simple Tutorial](http://www.kuro5hin.org/story/2004/3/9/16838/14935)).  Screen is optional but recommended, this tutorial will make no further mention of it, you should just use it as appropriate, or if you don't wish to use it, simply remove it from the following command.

Log into the server as root and install openssh:

    # apt-get install openssh-server screen

You may need to create some static routes in `/etc/network/interfaces`, depending from where you will be ssh'ing.

Return to the comfort of your workstation and ssh into the server in the usual way (this isn't a tutorial on ssh!).

## Install K Desktop Environment (KDE)

We use KDE, so these instructions are specific to KDE; however you can simply change the install command below according to the desktop environment that you prefer.

N.B. Note that I am installing the minimum software, if you prefer to have KDE in total, then just install `kde-desktop` instead of `kde-core kdm`.

N.B. Change `kde-i18n-engbi` for the correct package for your language.

    # apt-get install kde-core kdm kde-i18n-engb

N.B. Even installing a base KDE will result in a large number of packages being downloaded, go get yourself a cup of coffee.

## Reboot

Now reboot the server, and ensure that you get a graphical login on the console.

## Install LTSP

N.B. Please read the [Debian LTSP Howto](http://wiki.debian.org/LTSP/Howto) before continuing.

N.B. Please note that there are now [lenny-backports](http://wiki.debian.org/LTSP/Howto/Lenny-With-Backports) available.

    # apt-get install ltsp-server-standalone

You can safely ignore the error message about DHCP server not being "authoritative", and don't worry that your DHCP server doesn't start - you need to configure it before it will start cleanly.

## Build LTSP Client

N.B. Please note that there are now [lenny-backports](http://wiki.debian.org/LTSP/Howto/Lenny-With-Backports) available.

    $ ltsp-build-client

The [ltsp-build-client]({% post_url 2010-03-30-ltsp-build-client %}) command will download a complete Debian filesystem into `/opt/ltsp/i386` (or specify an alternate location with '--base') and install the ltsp-client and ldm packages (the LTSP Display Manager).

N.B. If you change the IP data after you have done the initial setup and run [ltsp-update-sshkeys]({% post_url 2010-03-30-ltsp-update-ssh-keys %}) on the server.

N.B. The files the client will boot are installed on the server into `/var/lib/tftpboot`, unlike LTSP4.2 which installed in `/tftpboot`.

## Set-up NFS Share

    $ nano /etc/exports
    /opt/ltsp       *(ro,no_root_squash,async,no_subtree_check)
    $ invoke-rc.d nfs-kernel-server reload

The 2 ltsp configuration files inside the client are `/etc/lts.conf` and `/etc/default/ltsp-client-setup`. See the examples in `/usr/share/doc/ltsp-client*`. Also see the [Edubuntu wiki](http://doc.ubuntu.com/edubuntu/edubuntu/handbook/C/customizing-thin-client.html).

## Configure DHCP Server

    # cp /etc/dhcp3/dhcpd.conf /etc/dhcp3/dhcpd.conf.lenny
    # cp /etc/ltsp/dhcpd.conf /etc/dhcp3/
    # nano /etc/dhcp3/dhcpd.conf

Edit `/etc/dhcp3/dhcpd.conf`, updating the IP addresses according for your network.

## Test Client Boot 

Now is the time to test that your client is booting okay.

## Audio Set-up

Next we need to set-up the audio, and to that end please follow the instructions on our LTSP5 Sound page:

   * [LTSP5 Sound]({% post_url 2009-04-30-ltsp5-sound %})

## Local Devices Set-up

Next we need to set-up local devices, and to that end please follow the instructions on our LTSP5 Local Devices page:

   * [LTSP5 Local Devices]({% post_url 2010-11-19-ltsp5-local-devices %})

## Optional - Installing FreeNX

If you wish to be able to remotely support your server with a GUI, then you may like to install freeNX:

   * [Install FreeNX](/howto/install-freenx/)

Then visit the NoMachine website and download the client for your PC.

## Optional - KDE Style Changes

N.B. These instructions will increase server load, but do make KDE look a great deal more attractive - your choice.

I apologise in advance for this section; I know that "Bling" has no place on a server, but equally I know that getting Linux adopted in your workplace is tough, and a little bling goes a long way towards user acceptance.  Unfortunately these changes WILL increase the load on the server, if you are not happy with this, then simply skip this section.

### Crystal Windows Decoration

    # apt-get install kwin-style-crystal

Go to the KDE Control Panel, Appearance & Themes and change the Windows Decorations to Crystal.  Then, under the General tab, make the top corners rounded, and increase the titlebar size to 21.  Under the Buttons tab, change the buttons to Kubuntu-Edgy.  Under the Background tab, I suggest you switch off transparency, which will but an unnecessary load on the server.  Under the Overlay tab, change both active and inactive to Simple Lighting.

### NuoveXT

    # apt-get install kde-icons-nuovext

Go to the KDE Control Panel, Appearance & Themes and change the Icons to nuoveXT.  Under the Advanced tab you may like to increase the Desktop icon size to 48, which suits these icons.

### Desktop Background

I believe one of the most attractive backgrounds is a simple two colour elliptic gradient.  To achieve this, simply go to KDE Control Panel, Appearance & Themes, Background. Change the Background picture to "No Picture" and set colours to Elliptic Gradient.  You can choose any two colours, but these two look good:

    #2E3B4E
    #7698CA

Other colours may not go well with the rest of my suggested changes.

### Panel

The default panel doesn't look that great, you can download any number of Kicker Wallpapers from KDE Look, but one that I think looks very good is this one:

   * [Apple-like Kicker Wallpaper](http://www.kde-look.org/content/show.php/Apple-like+kickers+background?content=88147)

It looks plain on that page, but much better in KDE.

## Add Debian Multimedia Repository

The Debian Multimedia is a useful resource for multimedia codecs, converters and players.  In particularly it includes Adobe Flash Player.  This is not an official repository, although it is a very common one.  I have decided to take the risk of installing this software on my system, you may not agree!

Edit `/etc/apt/sources.list` and add the following repository:

    deb http://www.debian-multimedia.org lenny main

Download and install the following:

   * [debian-multimedia.org keyring](http://www.debian-multimedia.org/pool/main/d/debian-multimedia-keyring/debian-multimedia-keyring_2008.10.16_all.deb)

    # dpkg -i debian-multimedia-keyring_2008.10.16_all.deb
    # aptitude update

## Optional - Iceweasel

In my opinion, Konqueror, whilst an amazing piece of software, is not going to be suitable as your main web-browser.  Mozilla Firefox is the answer, and this is available in the Lenny repositories, named "Iceweasel".

    # apt-get install iceweasel icedtea-gcjwebplugin flashplayer-mozilla mozilla-acroread mozilla-mplayer

Unfortunately, being a GTK application (not native to KDE) it looks ghastly, so...

## Optional - GTK Applications in KDE

GTK applications in KDE always look horrible. In Kubuntu this is taken care of for you, but in Debian it is only a quick install away:

    # apt-get install gtk-qt-engine

There are other ways of achieving this, e.g. qtcurve, but for me this seems perfectly satisfactory. Having installed, you visit your control panel and you will find a new option under "Appearance & Themes" called "GTK Styles and Fonts" change this to use your KDE style for your GTK applications, and restart KDE.

## Optional - Other Applications

Applications you might consider installing for your users are:

   * **KUser** : `apt-get install kuser`
   * **The Gimp** : `apt-get install gimp gimp-help-en gimp-data-extras`
   * **Inkscape** : `apt-get install inkscape`
   * **Scribus** : `apt-get install scribus-ng scribus-ng-doc scribus-template` (Development branch, but more up-to-date than "scribus")
   * **OpenOffice** : `apt-get install openoffice.org-kde openoffice.org-help-en-gb openoffice.org-l10n-en-gb openclipart-openoffice.org`
   * **Freemind** : `apt-get install freemind`
   * **KCalc** : `apt-get install kcalc`
   * **Microsoft Fonts** : `apt-get install ttf-mscorefonts-installer`
   * **KeePassX** : `apt-get install keepassx`
   * **Unison** : `apt-get install unison unison-gtk`
   * **Wine** : `apt-get install wine wine-utils`
   * **Kontact** : `apt-get install kontact`
   * **Ark** : `apt-get install ark`
   * **Dia** : `apt-get install dia`

## Optional - Install KVM Virtualisation

If you intend adding a virtualised Windows server on top of the LTSP server (not recommended - but we do it and it works well), then you need KVM (or an alternative) installed:

N.B. I suggest you right-click on the following link and Open in New Tab, so that you don't lose your place in this document.

   * [How to install KVM](/howto/install-kvm/)

## Optional - UMask

I dislike that every created file is given read access to all users, to change this behaviour we need to change `umask`.  In KDE the easiest way to achieve this system wide is by editing `/etc/profile` and changing the umask line from the default line of `umask 022` to your preferred setting.  We use `umask 007`, which gives full access to the user and group, but no access to other.

    Default permissions umask 022: -rw-r--r--
    New permissions     umask 007: -rw-rw----

Your view may well vary from mine.

##  Set Client Root Password

You will almost certainly need access to the client, in order to troubleshoot:

    # chroot /opt/ltsp/i386
    # passwd root
    Enter new UNIX password:
    Retype new UNIX password:
    passwd: password updated successfully
    # exit
    exit
    # ltsp-update-image

## References

   * [Debian LTSP](http://wiki.debian.org/LTSP)
      * [Debian Lenny Howto](http://wiki.debian.org/LTSP/Howto)
      * [Debian Lenny Backports Howto](http://wiki.debian.org/LTSP/Howto/Lenny-With-Backports)
   * [HP Proliant Debian Lenny Installation Instructions by HP](ftp://ftp.hp.com/pub/softlib2/software1/pubsw-linux/p1538177301/v45350/Debian-5.0-lenny-readme.pdf) [Alternative link](http://h71028.www7.hp.com/enterprise/downloads/Debian-5.0-lenny-readme.pdf)
   * [GNU Screen Manual](http://www.gnu.org/software/screen/manual/screen.html)
      * [Simple Tutorial](http://www.kuro5hin.org/story/2004/3/9/16838/14935)
   * [Linux Partitioning mini-FAQ](http://linuxmafia.com/~karsten/Linux/FAQs/partition.html)
   * [Installing KDE](http://pkg-kde.alioth.debian.org/kde3.html)
   * [Installing Adobe Flash in Debian](http://www.debianadmin.com/how-to-install-adobe-flash-in-debian-etchlennysid.html)
   * [Ubuntu Thin Client Howto](https://help.ubuntu.com/community/ThinClientHowto)

