---
layout: post
title: Howto &#124; SeamlessRDP
menu: howto
date: 2010-06-08 17:02:16
weight: 40
category: technology
tags: [linux, rdp]
---

Before proceeding please visit [Cendio](http://www.cendio.com/seamlessrdp/) and [Fontis](http://www.fontis.com.au/rdesktop) and use their respective instructions in preference to this page.

## Cendio SeamlessRDP

The Cendio SeamlessRDP component has two halves, a Windows executable as the "server component" for installation on the Windows server, and patches to the rdesktop application, to work with the server component.  At the time of writing, these Cendio patches have now been merged into the rdesktop 1.5.0 and later core.

<!--more-->

   * You can download [the source](http://rdesktop.svn.sourceforge.net/viewvc/rdesktop/seamlessrdp/trunk/) using Subversion.
   * You can [get a binary](http://www.cendio.com/seamlessrdp/seamlessrdp.zip) and unzip the files into `c:\seamlessrdp` (or similar).

Once you have a binary on your Windows server, then from you Linux client, type:

    $ rdesktop -A -s "c:\seamlessrdp\seamlessrdpshell.exe notepad"

**Under W2K8, both seamlessrdpshell.exe, and the Windows application you wish to run with it, must be published terminal services applications.  And seamlessrdpshell.exe must have command line parameters enabled, by running "TS RemoteApp Manager's" "Add RemoteAppProgram" dialog (remoteprograms.msc).**

## Fontis SeamlessRDP

Fontis have further developed Cendio SeamlessRDP, to enable connection sharing, allowing a single rdesktop connection to launch multiple applications.  When run in seamless mode, rdesktop creates and listens on a control socket.  A new option allows rdesktop to be run in slave mode, which notifies the master rdesktop instance of a new command to be run and then exits.  The master instance sends a client-to-server message to the SeamlessRDP server component, which runs the new command.

I see this development as fairly fundamental to the use of SeamlessRDP.

### Installation of Fontis patch

Download source for the latest version of rdesktop from CVS (press enter when prompted for a password): 

    $ cvs -d:pserver:anonymous@rdesktop.cvs.sourceforge.net:/cvsroot/rdesktop login
    $ cvs -z3 -d:pserver:anonymous@rdesktop.cvs.sourceforge.net:/cvsroot/rdesktop co -P rdesktop

Alternatively, download the [rdesktop CVS snapshot](http://www.fontis.com.au/system/files/rdesktop_src.tar.gz) which has been tested with the patch.  Download the rdesktop patch to the checked out directory:

    $ cd rdesktop $ wget http://www.fontis.com.au/system/files/rdesktop.patch

Apply the patch and compile:

    $ patch -p1 < rdesktop.patch
    $ ./bootstrap
    $ ./configure
    $ make

Download updated server component and unpack. Alternatively, obtain the seamlessrdp CVS snapshot or download direct from CVS, apply the seamlessrdp patch and then compile:

    $ cvs -z3 -d:pserver:anonymous@rdesktop.cvs.sourceforge.net:/cvsroot/rdesktop co -P seamlessrdp
    $ patch -p1 < seamlessrdp.patch

### Usage

The following examples assume the SeamlessRDP server component files (seamlessrdpshell.exe, seamlessrdp.dll and vchannel.dll) have been unpacked to `C:\seamlessrdp`.
To start a SeamlessRDP session, invoke rdesktop in the same way as before applying the patch:

    $ ./rdesktop -A -s "C:\seamlessrdp\seamlessrdpshell.exe notepad" server

To run a new command inside the existing SeamlessRDP session: 

    $ ./rdesktop -l "calc"

New command-line options:

   * -M: Specify the path for the control socket that the rdesktop process listens on. By default, this is `$HOME/.rdesktop/seamless.socket`
   * -l: Instead of starting a new rdesktop process, connect to an existing process' control socket and tell it to run a command on the server. Can be combined with the -M option to use a non-standard socket.
