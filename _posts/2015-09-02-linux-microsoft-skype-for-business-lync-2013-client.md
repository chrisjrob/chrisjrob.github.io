--- 
layout: post 
title: Linux Microsoft Skype For Business Lync 2013 Client
date: 2015-09-02
type: post 
published: true 
status: publish
category: technology
tags: [linux, ubuntu, microsoft, skype, lync]
image: pidgin.png
---

<img src="/assets/pidgin.png" class="image-right" alt="Pidgin Instant Messenger">

I was surprised to learn that Ubuntu 14.04 can talk to Skype for
Business AKA Lync 2013 using the Pidgin Instant Messaging client. The
general steps were:

    # apt-get install pidgin pidgin-sipe

And then restart Pidgin and add a new Account. The Office Communicator
is the relevant plugin, with the following parameters:

<!--more-->

  * Protocol: Office Communicator
  * Username: Your Office 365 or Skype for Business username - probably
    your email address
  * Password: Your password is obviously required - and will be stored
    unencrypted in the config file, so you may wish to leave this blank
    and enter at each login
  * Server[:Port]: Leave empty if your set-up has autodiscovery
  * Connection type: Auto
  * User Agent: UCCAPI/15.0.4420.1017 OC/15.0.4420.1017
  * Authentication scheme: TLS-DSK

I am unclear why the user agent is required, and whether that will need
to change from time to time or not. So far it has worked fine here.

Unfortunately a few days ago the above set-up stopped working, with
"Failed to authenticate with server". It seems that you must now use
version 1.20 of the Sipe plugin, which fixes "Office365 rejects RC4 in
TLS-DSK". As this version was only completed three days ago, it is not
yet available in any of the Ubuntu repositories that I have been able to
find, you will probably have to compile yourself.

Broadly speaking I followed these key stages:

1.  Install build tools if you don't already have them:

    `sudo apt-get install build-essential`

2.  Install checkinstall if you don't already have it:

    `sudo apt-get install checkinstall`

3.  [Download source files](http://sourceforge.net/projects/sipe/files/sipe/pidgin-sipe-1.20.0/pidgin-sipe-1.20.0.tar.gz/download).

4.  Extract source:

    `tar -xvvzf pidgin-sipe-1.20.0.tar.gz`

5.  Change into source directory:

    `cd pidgin-sipe-1.20.0`

6.  Read carefully the README file in the source directory.

7.  Install dependencies listed in the README:

    `# apt-get install libpurple-dev libtool intltool pkg-config libglib2.0-dev libxml2-dev libnss3-dev libssl-dev libkrb5-dev libnice-dev libgstreamer0.10-dev`

These dependencies may change over time, and your particular
requirements may be different from mine, so please read the README and
that information should take precedence.

Lastly, as an ordinary user, you should now be able to compile. If it
fails at any stage, simply read the error and install the missed
dependency.

    $ ./configure --prefix=/usr
    $ make
    $ sudo checkinstall

I found checkinstall was pre-populated with sensible settings, and I was
able to continue without making any changes. Once complete a Debian
package will have been created in the current directory, but it will
have already been installed for you.

For some reason I found that at this stage Pidgin would no longer run,
as it was now named `/usr/bin/pidgin.orig` instead of `/usr/bin/pidgin`, I
tried removing and reinstalling pidgin but to no avail. In the end I
created a symlink (`ln -s /usr/bin/pidgin.orig /usr/bin/pidgin`), but you
should not do this unless you experience the same issue. If you know the
reason for this I would be delighted to receive your feedback, as this
isn't a problem that I have come across before.

Restarting Pidgin and the Office Communicator sprung into life once
more. Sadly I would imagine that this won't be the last time this plugin
will break, such are the vagaries of connecting to closed proprietary
networks.

