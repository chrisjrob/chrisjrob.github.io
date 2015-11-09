---
layout: post
title: Howto | Install Courier-IMAP Server
menu: howto
date: 2009-03-21 06:00:37
weight: 40
category: technology
tags: [howto, linux, imap, mailserver]
---

## Introduction

Courier-IMAP is quick and easy to install, but is probably not your best option for running a first class IMAP server.  In particularly I have been strongly recommended `Cyrus IMAP server`.  The big advantage to Courier-IMAP is that it can be very easily installed on your LTSP server as a temporary migration tool for email, i.e. to transfer users from Windows to Linux.

## Install IMAP

    $ sudo apt-get install courier-imap

This will prompt whether to create files for use by the web interfaces; it is safe to select "No" here.

Now you need to choose a directory where your mail will live:

    $ sudo mkdir -p /opt/imap-mail

Now we need to define our users in the courier-imap user database. There are several ways to do this, including mass conversion of all your users in /etc/passwd using the pw2userdb tool as mentioned in the courier FAQ. Here is what we do to create a single user:

    $ sudo touch /etc/courier/userdb
    $ sudo chmod 600 /etc/courier/userdb
    $ sudo userdb ~userid~ set uid=<1000> gid=<1000> shell=/bin/bash home=/opt/imap-mail/~userid~

*Edit the final line as appropriate.

Now you need to set the users password and create the directory that will store all our e-mail:

    $ sudo userdbpw -md5 | sudo userdb <peanut> set systempw
    $ sudo mkdir -p /opt/imap-mail/<userid>
    $ sudo maildirmake /opt/imap-mail/<userid>/Maildir
    $ sudo chown -R <1000>:<1000> /opt/imap-mail/<userid>

In the `/etc/courier/authdaemonrc` file, make sure you set the following value:

    authmodulelist="authuserdb"

Note that you may need to replace the existing authmodulelist value. Now prepare the user DB and restart the entire system:

    $ sudo makeuserdb
    $ sudo /etc/init.d/courier-authdaemon stop
    $ sudo /etc/init.d/courier-imap stop
    $ sudo /etc/init.d/courier-authdaemon start
    $ sudo /etc/init.d/courier-imap start 

The IMAP system is now ready.

## References

   * http://www.howtoforge.com/converting_outlook_pst_to_maildir

