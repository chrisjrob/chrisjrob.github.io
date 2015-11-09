---
layout: post
title: Howto | Install 2x Client
menu: howto
date: 2009-03-21 05:59:44
weight: 40
category: technology
tags: [howto, linux, 2x]
---

## Download 2x Client

At the time of writing there are no Debian-based packages, so download the RPM client from the 2x website:

   * http://www.2x.com/

## Installing 2x Client

### Alien Installation

In order to convert the RPM package into a DEB package, we need to install alien:

    # alien --scripts -i 2xApplicationServerClient3.i386.rpm

By installing the rpm this way on a Debian based system it can be removed later through your package manager or using apt-get. The package name is applicationserverclient.

If you get an error from the running the scripts you will need to install the .bz2 version instead.

### Alternative Binary Installation

To do that, download the file into your home directory and run the following commands.

    # tar xvjf 2xApplicationServerClient3.tar.bz2
    # cd opt/2X/applicationserverclient/scripts
    # chmod 755 install.sh
    # ./install.sh

Assuming you are still in the scripts directory, type the following command to get to the bin directory.

    # cd ../bin

## Usage

Next you need to start the client and connect to the ApplicationServer. The first line below shows the syntax you need to use and the second is an example. You'll need to adjust the values to match your system.

    # ./appserverclient -s"Server IP" -a"Application Name" -u"User Name" -p"Password"
    # ./appserverclient -s192.168.1.5 -a"Internet Explorer" -uAdministrator -ppassword

## References

   * http://www.2x.com/applicationserver/downloadlinks.html
   * Beta releases:
      * http://downloads.2x.com/AppServer-LoadBalancer/betaversion/
