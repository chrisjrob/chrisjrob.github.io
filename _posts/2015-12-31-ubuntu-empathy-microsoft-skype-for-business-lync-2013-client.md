--- 
layout: post 
title: Ubuntu Empathy Microsoft Skype For Business Lync 2013 Client
date: 2015-12-31 10:23:32
type: post 
category: technology
tags: [linux, microsoft, lync, skype]
image: empathy.png
published: true
---

I wrote recently regarding using [Microsoft Skype for Business / Lync 2013 in Pidgin]({% post_url 2015-09-02-linux-microsoft-skype-for-business-lync-2013-client %}), this has worked really well for our Lubuntu 14.04 clients, running Pidgin. 
Having some time off work I decided to try and get this working also on [my Ubuntu 14.04 laptop]({% post_url 2015-10-09-lenovo-thinkpad-x1-carbon-gen-3 %}).

The problem is that Ubuntu uses Empathy by default, rather than Pidgin, but I found that the steps were virtually identical (cut and pasted from my earlier post):

<!--more-->

## Download and Dependencies

1.  Install build tools if you don't already have them:

    `sudo apt-get install build-essential`

2.  Install checkinstall if you don't already have it:

    `sudo apt-get install checkinstall`

3.  [Download source files](http://sourceforge.net/projects/sipe/files/sipe/pidgin-sipe-1.20.1/pidgin-sipe-1.20.1.tar.gz/download).

4.  Extract source:

    `tar -xvvzf pidgin-sipe-1.20.1.tar.gz`

5.  Change into source directory:

    `cd pidgin-sipe-1.20.1`

6.  Read carefully the README file in the source directory.

7.  Install dependencies listed in the README:

    `# apt-get install libpurple-dev libtool intltool pkg-config libglib2.0-dev libxml2-dev libnss3-dev libssl-dev libkrb5-dev libnice-dev libgstreamer0.10-dev`

These dependencies may change over time, and your particular requirements may be different from mine, so please read the README and that information should take precedence.


## Compile and Install

Lastly, as an ordinary user, you should now be able to compile.
If it fails at any stage, simply read the error and install the missed dependency.

    $ ./configure --prefix=/usr
    $ make
    $ sudo checkinstall

I found checkinstall was pre-populated with sensible settings, and I was able to continue without making any changes.
Once complete a Debian package will have been created in the current directory, but it will have already been installed for you.


## Add Account in Empathy

Still in a terminal type:

    $ empathy-accounts

Then simply click the + button to add an account, select the Account Type "sipe", enter your email address in the Account field and click Log-in. 
Then highlight the newly created account and Edit Connection Preferences, opening up the Advanced section. 
I completed the following:

 * Login: enter your Skype for Business email address
 * Password
 * Server: leave blank
 * Transport: auto
 * User agent: UCCAPI/15.0.4420.1017 OC/15.0.4420.1017
 * Authentication: auto

And that really was all that there was to it.
