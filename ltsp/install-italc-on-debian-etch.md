---
layout: page
title: "LTSP | Install iTalc on Debian Etch"
menu: ltsp
weight: 14
category: technology
tags: [ltsp]
---

## Introduction

**Stop!  I believe there are now instructions on the 'net for installing the client on the client instead of on the server**

iTalc is a "teacher tool" including screen shadowing functionality.  It has replaced Thin Client Manager in Edubuntu 8.04.

The problem with italc is that the documentation is, I believe, for LTSP4.2, not LTSP5.  Worse, the [Download >> Debian](http://italc.sourceforge.net/wiki/index.php?title=Download:Debian) points at a defunct location, and goes on to state that the official Debian repositories contain out-of-date packages.

The following is a description for installing from source; which largely the document I followed, and you should read it in conjunction with this:

   * <http://indianalinux.blogspot.com/2007/02/howto-install-italc-from-source-on.html>

## Warnings

This is a description of how I personally installed iTalc on Debian Etch with KDE 3.55.

The installation worked fine, except that iTalc kept bombing out every few seconds, making it completely useable.  It was quite obvious that this was down to Qt4, which Etch's version is too old for iTalc.  Unfortunately there was no backports, so I ended up installing Qt4 from Lenny; resulting in several additional packages needing to be installed.  This immediately resolved the stability issues.

## Download source

Navigate to the [italc download page](http://sourceforge.net/project/showfiles.php?group_id=132465) and copy the link to the latest tar.gz file.

    $ cd /usr/src
    $ sudo wget http://downloads.sourceforge.net/italc/italc-1.0.9-rc4.tar.bz2?modtime=1215423893&big_mirror=0

## Extract

    $ sudo tar -xvvjf italc-1.0.9-rc4.tar.bz2
    $ cd italc*

## Read installation notes

Yes, believe it or not you shouldn't follow howto's like this blindly, instead read the developer's installation instructions and make your own judgements!

    $ cat INSTALL | more

## Install dependencies

At the time of writing the above install file stated the following dependencies, which you should now install:

    $ sudo apt-get install libqt4-dev qt4-dev-tools xorg-dev libxtst-dev libjpeg62-dev zlib1g-dev libssl-dev

xorg-dev will install a great many other files (probably worth removing them later)

In addition, we will need build-essential, in order to compile from source:

    $ sudo apt-get install build-essential

And lastly, [this page](http://indianalinux.blogspot.com/2007/02/howto-install-italc-from-source-on.html) included the following dependency, which we may as well install:

    $ sudo apt-get install libxtst-dev

## Compile and install

As normal we need to ensure that we are in the source directory and then:

    $ ./configure --prefix=/usr

If that completes successfully, we can proceed to make:

    $ make

And, if that completes successfully, we can proceed to install:

    $ sudo make install

## Client installation on the server

The installation was done as part of the server install, so all we need to do is create the client keys:

    $ sudo ica -role teacher -createkeypair

Change permissions to increase security:

    $ sudo addgroup italc
    $ sudo adduser username italc
    $ sudo chgrp -R italc /etc/italc/keys/private
    $ sudo chmod -R o-rwx /etc/italc/keys/private

This method has a problem in that all the clients are going to be coming from the same IP address, i.e. the server IP, so we need to give each user their own port.  A good idea is to base the port number on 10000 + the last segment of their IP address.  Edubuntu has a script for this, which requires the $LTSP_CLIENT variable to be present. I have modified so that it instead uses the $SSH_CLIENT variable, as follows:

    #!/bin/sh

    # /usr/bin/ica-launcher
    if [ "$SSH_CLIENT" ]
    then
            PORT=`echo $SSH_CLIENT | awk -F . '{print \$4}' | awk -F " " '{print \$1}'`
            IVS=$((10000 + $PORT))
            ISD=$((11000 + $PORT))
            ica -noshm -ivsport $IVS -isdport $ISD &
    else
            ica -noshm
    fi

## Autostart

We need the client to run automatically when users log in.  In KDE this means a .desktop file in /usr/share/autostart.  If you're unsure how to do this, then an example "italc.desktop" file is shown below:

    /usr/share/autostart/italc.desktop:

    [Desktop Entry]
    Comment=
    Comment[en_GB]=
    Encoding=UTF-8
    Exec=/usr/bin/ica-launcher
    GenericName=
    GenericName[en_GB]=
    Icon=/usr/share/icons/italc.png
    MimeType=
    Name=iTalc Client
    Name[en_GB]=iTalc Client
    Path=
    StartupNotify=true
    Terminal=false
    TerminalOptions=
    Type=Application
    X-DCOP-ServiceType=
    X-KDE-SubstituteUID=false
    X-KDE-Username=

You also need to exclude from session restoring for all users (if you use KDE session restore):

    /home/username/.kde/share/config/ksmserverrc:

    [General]
    excludeApps=ica

**Do the same for `/etc/skel/.kde/share/config/ksmserverrc` to effect new users when they are created.**

## Alternative Method - client installation in chroot

In theory I would have liked to have the client installed in the chroot.  This should run quicker and provide full functionality of logon/logoff etc.  In practice I was unable to get this working, with very much the same results as I had with x11vnc, in that the software would run, but netstat would not show any ports opened.  A mystery.  After spending a couple of days on this, I decided to give up and instead run both client and server on the server.

If you are determined to install in the chroot, I found that it was possible to download and install the following prebuilt binaries for Ubuntu (requires some packages installing from lenny):

   * http://www.stgraber.org/download/ubuntu/italc/hardy-i386/

This will automatically generate the keys, and you will need to copy the private key to the server.

Also, you should probably make the X.Org Module change (see below).

And don't forget to update the image:

    $ sudo ltsp-update-image

## References

   * http://italc.sourceforge.net/
      * http://italc.sourceforge.net/wiki/index.php?title=ITALC_in_a_ThinClient_environment
   * https://wiki.ubuntu.com/iTalc
   * http://italc.sourceforge.net/home.php
   * http://wiki.skolelinux.de/Etch/Italc
   * http://www.stgraber.org/
   * http://indianalinux.blogspot.com/2007/02/howto-install-italc-from-source-on.html
