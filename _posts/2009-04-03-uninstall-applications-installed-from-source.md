---
layout: post
title: Howto | Uninstall applications installed from source
menu: howto
date: 2009-04-03 09:21:03
weight: 40
category: technology
tags: [howto, linux]
---

## The Problem

Sometimes you have to compile and install packages from source.  Other times you have to install an application from a tarball.  But how do you uninstall it? 

## Automated uninstall method

    $ cd /usr/src/<yourapp>
    $ make uninstall

<!--more-->

This will probably fail with make:

    *** No rule to make target `uninstall'.  Stop.

## Manual uninstall method

In which case your only recourse is to manually unpick the application. One way to do this is to run the following:

    $ cd /usr/src/package &larr; assuming you still have the source
    $ sudo make -n install > install.log

I.e. reinstall the application (if you still have the source code) and then read the install.log file and work backwards unpicking the changes made by the installation.

## Checkinstall

As usual prevention is better than cure, and in this case the answer is to always install applications with checkinstall (available in the Debian repositories).  This converts an installer into debian package, which can then be installed and uninstalled like any other debian package.

    $ sudo apt-get install checkinstall
    $ man checkinstall

Then to use checkinstall, you simply prefix your install command with "checkinstall".  So compiling an application from source would look like this:

    $ ./configure
    $ make
    $ sudo checkinstall make install

Or if you are installing from a ./install.sh or some such, just prefix this with "checkinstall" - e.g.

    $ sudo checkinstall ./install.sh

This will result in the creation and installation of a "deb" package.  This means that you can upgrade or simply remove the package simply using the "dpkg -r packagename" command.

**If you're not on a Debian-based system, then just add the relevant switch for rpm or slackware packages (read the man page).**

## Warning

In theory you could upgrade a package installed by checkinstall, once an application enters the standard repos, in practice you might get messed up; as checkinstall is quite likely to install stuff in different locations to a standard debian/ubuntu package.  In practice this issue only arises very occasionally (there is a reason why you installed the package from source/tarball).  But if it does happen, then you are probably best advised to remove the package using "dpkg -r" and then install it from the repos in the usual way.

## References

   * [Checkinstall Homepage](http://www.asic-linux.com.mx/~izto/checkinstall/)
   * [Debian Tutorial](http://www.debian-administration.org/articles/147)
   * [Falko Timme's Tutorial](http://www.falkotimme.com/howtos/checkinstall/index.php)

