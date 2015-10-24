## Install IES4Linux on LTSP

<<<---
%TOC%
<<<---

### Recent developments

#### Bugs

Versions of Wine greater than 0.92 seem to cause IES4Linux to consume vast amounts of CPU both for wineserver and iexplore.exe. This problem seems to occur when accessing SSL pages (possibly Active-X pages).  Bugs have been {logged with Ubuntu|https://bugs.launchpad.net/bugs/205895} which was quite rightly {redirected to Wine|http://bugs.winehq.org/show_bug.cgi?id=13687}, which was rejected pending a {regression test|http://bugs.winehq.org/show_bug.cgi?id=13734}, which in turn was redirected to IES4Linux.  The issue seems to be that Wine do not support native DLLs, but these are essential in making IE work under Linux.

#### Deb package

There ~may~ be a multi-user install deb package (for Ubuntu at least):

   * http://ubuntuforums.org/showthread.php?t=636758

### Install Wine

Make sure you've installed Wine.

### Read Debian Installation

   * http://www.tatanka.com.br/ies4linux/page/Installation:Debian

### Master Installation IES4Linux

First you must create a master installation of ies4linux under /usr/local. To create the master copy, perform a standard ies4linux install as an ordinary desktop user (i.e. unpack the tarball, run ./ies4linux):

<pre>
$ wget http://www.tatanka.com.br/ies4linux/downloads/ies4linux-latest.tar.gz
$ tar zxvf ies4linux-latest.tar.gz
$ cd ies4linux-*
$ ./ies4linux
</pre>

### Convert to Multi-user System

   * http://www.tatanka.com.br/ies4linux/forum/viewtopic.php?t=431

<pre>
$ cd
$ rm bin/ie{5,55,6}
$ sudo mkdir -p /usr/local/share
$ sudo chmod a+rX /usr/local/share
$ sudo mv .ies4linux /usr/local/share/ies4linux
$ sudo chown -R root:root /usr/local/share/ies4linux
$ sudo chmod -R a+rX /usr/local/share/ies4linux
</pre>

Then install this script as any or all of /usr/local/bin/ie{5,55,6} and let your users run it:

<pre>
#!/bin/sh
# Launch script for multiuser ies4linux, master copy in /usr/local/share.
# Install as /usr/local/bin/ie6 (or ie55 or ie5)
#
# Blame Andrew Chadwick <andrewc-ies4linux0606@piffle.org>, not Sérgio.
#
# Released under the GNU GPL version 2 (or later, your call).
# See ies4linux's own LICENSE or COPYING file for more information.
##############################################################################

IE=`basename "$0"`
MASTERPREFIX="/usr/local/share/ies4linux/$IE"
WINEPREFIX="${HOME}/.ies4linux/$IE"

# If we're not set up, create the user's magic symlink-copy of the master
# installation.

if ! test -d "$WINEPREFIX"; then
    if ! mkdir -p "$WINEPREFIX"; then
        echo "mkdir $WINEPREFIX failed"
        exit 1
    fi
    if ! lndir "$MASTERPREFIX" "$WINEPREFIX"; then
        echo "lndir failed: is xutils installed?"
        exit 1
    fi

    # The profile directory will be recreated automatically by wine on the
    # first run, so it's OK to blow away eny existing copy hanging around in
    # unwritable symlink form from the install, and it's OK to just create a
    # blank one.
   
    PROFILES="$WINEPREFIX/drive_c/windows/profiles"
    rm -fr "$PROFILES"
    mkdir -p "$PROFILES"

    # WINE needs to be able to write to the following files, so they can't be
    # symlinks to root-owned ones.
   
    for file in .no_prelaunch_window_flag system.reg userdef.reg user.reg; do
        if test -L "$WINEPREFIX/$file"; then
            rm -f "$WINEPREFIX/$file"
            cp "$MASTERPREFIX/$file" "$WINEPREFIX/$file"
        fi
    done
    chmod -R og-rwx "$WINEPREFIX"
fi

export WINEPREFIX
exec wine "$WINEPREFIX/drive_c/Program Files/Internet Explorer/IEXPLORE.EXE"
echo "Failed to launch WINE: see above for details"
exit 1
</pre>

Run the script above as an ordinary desktop user. When it runs, this script tries to create a WINE prefix location under the user's home, consisting mainly of symlinks to the master copy's files. It then launches IE in the normal way.

If it screws up, delete your ~/.ies4linux directory and try again.
