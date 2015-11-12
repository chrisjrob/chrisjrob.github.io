---
layout: post
title: Howto | Protect against rootkits
menu: howto
date: 2009-03-21 06:20:17
weight: 40
category: technology
tags: [howto, linux, debian, rootkit, security]
---

Apparently **Rootkits** are a major problem in the linux world.  Unlike viruses, you are much more likely to be infected without realising that you even have a problem.  The purpose of this document is twofold:

 1. Check for existing infection
 2. Protect against future infection

If you are unsure what a Rootkit is, then please read the [Rootkit Wikipedia page](https://en.wikipedia.org/wiki/Rootkit) before continuing.

<!--more-->

## Warning

**This is how I checked and protected against rootkits and is not how I would recommend that anyone else should do so.**

## Step 1: rkhunter

I suggest you visit the rkhunter website at: http://rkhunter.sourceforge.net/
 
    $ sudo apt-get install rkhunter
    $ sudo rkhunter --upgrade
    $ sudo rkhunter --checkall --createlogfile

Read the output and take corrective action as required.

## Step 2: chkrootkit

I suggest you visit the chkrootkit website at:

   * http://www.chkrootkit.org

In particular, [the FAQS](http://www.chkrootkit.org/faq/#9) would suggest that you shouldn't trust the chkrootkit to use the commands on your system, bearing in mind that you suspect that they might be compromised; I chose not to take this additional precaution - you should make your decision based on the exposure of your server to the Internet and your assessment of the likelihood of your having a rootkit.

    $ sudo apt-get install chkrootkit
    $ sudo chkrootkit

## Step 4: tripwire

   * http://sourceforge.net/projects/tripwire/

Tripwire creates a database of your system files and then tracks any changes to them.

    $ sudo apt-get install tripwire

Follow all the prompts, which will require you to create a Site Key Pass-phrase and a Local key Pass-phrase.  Next we need to create the database:

    $ sudo tripwire --init
    Wrote database file: /var/lib/tripwire/hostname.domain.com.twd
    The database was successfully generated.

Next we run a first check:

    $ sudo tripwire --check

This will doubtless come back with far more information than you really want.  For example I received loads of lines about "/proc/PIDNO/".

## References

   * [Implementing Tripwire](http://sourceforge.net/docman/display_doc.php?docid=2078&group_id=3130)
   * [Howto Linux - Tripwire](http://www.alwanza.com/howto/linux/tripwire.html)

## A better way

   * [Combining AIDE and Tripwire](http://linuxgazette.net/issue98/moen.html)

