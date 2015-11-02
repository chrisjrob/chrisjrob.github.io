---
layout: page
title: Howto | Configure apt-get
menu: howto
weight: 40
---

## apt-get

### Remove CDROM installation

Firstly comment out the CDROM installation from `/etc/apt/sources.list`.  This seems to be done automatically from Lenny.

Next change any references to "stable" are replaced with the name of the current stable release, currently "Lenny".  If we don't do this, then when the next release "Squeeze" goes "stable", suddenly your system will be upgraded next time you do an apt-get upgrade.

    $ apt-get update

### Proxy Server

If it didn't work, then you may need to configure apt with your proxy server.

#### Option 1 - Edit apt.conf

The usual method is to add the following line to `/etc/apt/apt.conf`:

    $ nano /etc/apt/apt.conf
    Apt.conf:
    Acquire::http::Proxy "http://admin:password@proxy:port/"

Obviously it is not generally a good idea to have a username and password in plain text form in this way.

#### Option 2 - Environment Variable

It is also possible to add the proxy server to the environment variables:

    $ export http_proxy="http://admin:password@proxy:port/"
    $ export ftp_proxy="http://admin:password@proxy:port/"

Obviously this will be lost when you close the current console.  Again it is not a good idea to enter usernames and passwords as command line arguments, so you should clear your bash_history.

#### Option 3 - Update Proxy Server

Ideally you need to change your proxy server to allow traffic without the need to specify a username and password.

### Add Backports

In many cases you will require newer packages than are afforded by stable alone, and for that purpose you need Debian Backports.  To add backports, visit:

   * http://www.backports.org/dokuwiki/doku.php?id=instructions 

And follow the instructions on that page to add the repository to your sources, and add the security keyring.

### Pinning

If you have multiple sources in your sources.list, then in general the latest package will be selected by default.  You can change this behaviour by creating a file `/etc/apt/preferences`.  This is called "pinning".

Save as `/etc/apt/preferences`...

    Package: *
    Pin: release o=Debian,a=stable
    Pin-Priority: 900

    Package: *
    Pin: origin www.backports.org
    Pin-Priority: 600

    Package: *
    Pin: release o=Debian,a=testing
    Pin-Priority: 400

    Package: *
    Pin: release o=Debian,a=unstable
    Pin-Priority: 300

    Package: *
    Pin: release o=Debian
    Pin-Priority: -1

For a fuller description of pinning see the following page:

   * http://wiki.debian.org/AptPinning

### Saving and restoring package selections

To save your package selections:

    $ dpkg --get-selections >filename

**Remember to save your sources.list and preferences.**

To restore your package selections:

    $ dpkg --set-selections < filename
    $ apt-get upgrade-dselect

