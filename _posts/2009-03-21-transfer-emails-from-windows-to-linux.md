---
layout: post
title: Howto | Transfer Emails from Windows to Linux
menu: howto
date: 2009-03-21 06:22:56
weight: 40
category: technology
tags: [howto, linux, email, mailserver]
---

These instructions explain how to transfer emails from a Windows email client to Linux Kmail.  This document has a number of provisos:

 1. If your mailserver is running IMAP, then what are you doing here?  Just connect your Linux mail client to your IMAP server and you're good to go!
 2. If you are running a common mail client on Windows, then consider installing Mozilla Thunderbird on Windows and importing your emails into that...
    a. See [Transfer Emails from Microsoft Outlook]({% post_url 2009-03-21-transfer-emails-from-microsoft-outlook %})
 3. If you are running Mozilla Thunderbird on Windows, then you can simply copy the files onto Linux and use Mozilla Thunderbird on Linux - job done.
 4. If your Windows email client stores in mbox format (unlikely) then again you should be able to simply copy the mail store to Linux.
 5. Check whether you have any export options and see if you can export into an easier format, e.g. Thunderbird/MBOX.
 6. If your Windows email client does not support IMAP, then you will need to upgrade it to a more recent version that does before proceeding.
 7. If your Windows email client does support IMAP, then let's continue...

<!--more-->

## Install Courier-IMAP on server

See [Install Courier-IMAP Server]({% post_url 2009-03-21-install-courier-imap-server %})

## Create LTSP User

In KUserManager create the user, and add to the following groups:

   * kiosk-standard
   * Staff
   * Users
   * Fuse (only if you want them to be able to access USB devices)
   * Saned (only if you want them to be able to use scanning)

**Take a note of UID and GID before exiting KUserManager**

## Create IMAP Account

**You need to have installed an IMAP server first - see page Install Courier-IMAP Server**

    $ sudo userdb USERNAME set uid=9999 gid=9999 shell=/bin/bash home=/opt/imap-mail/USERNAME

*Replace USERNAME and 9999 for actual username, uid and gid

    $ sudo userdbpw -md5 | sudo userdb USERNAME set systempw
    $ sudo mkdir -p /opt/imap-mail/USERNAME
    $ sudo maildirmake /opt/imap-mail/USERNAME/Maildir
    $ sudo chown -R 9999:9999 /opt/imap-mail/USERNAME
    $ sudo makeuserdb
    $ sudo /etc/init.d/courier-authdaemon stop
    $ sudo /etc/init.d/courier-imap stop
    $ sudo /etc/init.d/courier-authdaemon start
    $ sudo /etc/init.d/courier-imap start

*Replace USERNAME and 9999 for actual username, uid and gid

## Key steps

The rest of the process is simple enough, that hopefully I do not need to go through it in detail.  Briefly:

   * Install Courier-IMAP Server
   * Create IMAP account in Windows email client
   * Log onto LTSP
   * Kontact &rarr; Mail &rarr; Create IMAP account
   * Transfer each mail folder into IMAP Inbox then transfer each IMAP folder into Kmail folder
   * Repeat last step for each folder

**Change each client to work off-line between transfers - you don't really want both clients connected to the same IMAP mailbox at the same time**

