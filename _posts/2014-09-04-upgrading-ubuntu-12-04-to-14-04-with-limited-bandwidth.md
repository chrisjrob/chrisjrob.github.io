--- 
layout: post 
title: Upgrading Ubuntu 12.04 To 14.04 With Limited Bandwidth
date: 2014-09-04
type: post 
published: true 
status: publish
categories: technology linux ubuntu
tags: apt-get bandwidth
---

<img src="/assets/ubuntu-1404-desktop.png" class="image-right" alt="Ubuntu 14.04 Desktop">

Upgrading Ubuntu at work can make you rather unpopular, as the Internet bandwidth
is fully utilised downloading all the updates to packages you have long
since forgotten that you installed.

It also takes time, time that you should be working rather
than upgrading your computer.

For these reasons I like to trickle download the upgrade over a day and
only perform the actual upgrade once all the packages are ready,
typically the following morning.

This is how I performed my low-bandwidth upgrade…

**N.B. This is not the official or recommended way of upgrading between
Ubuntu versions. Specifically my method involves manually disabling some
repositories and updating others to the new release. This would normally
be done by the do-release-upgrade program itself. It works for me, but
please do be aware that you are deviating slightly from the
official method.**

 

Step 1: Disable 3rd Party Repositories
--------------------------------------

Launch the Ubuntu Software Centre and from the menu select **Edit**
followed by **Software Sources**. Under the **Other Software** tab
please untick all active repositories.

(This step should in any case be done automatically by step 4).

Step 2: Update Repositories
---------------------------

Edit `/etc/apt/sources.list` and replace all occurrences of  "precise"
with "trusty". If you are of a brave disposition, the following command
should do this for you:

    $ sudo sed -i.bak 's/precise/trusty/g' sources.list

(This will create a copy of sources.list to sources.list.bak, in case
you wish to reverse this.)

Step 3: Download Packages
-------------------------

Still in the terminal, type:

    $ sudo apt-get updatesudo apt-get -o Acquire::http::Dl-Limit=64 -d dist-upgrade

The 64 will limit the bandwidth to 64 Kbps, please adjust to suit your
available bandwidth. The "-d" will instruct apt-get to merely download
the packages and not to install them.

I believe this stage can be aborted with Ctrl+C at any time and run
again, until such time as all the required packages are downloaded.

Step 4: Upgrade
---------------

Still in the terminal, I tend to use GNU Screen for extra resilience,
type:

    $ sudo do-release-upgrade

Conclusion
----------

I am typing this on my newly upgraded 14.04 installation, after a clean
and trouble-free reboot and an entirely fault-free upgrade.

The truly astonishing aspect to an upgrade is the fact that the computer
remains largely usable throughout. I lost my fonts briefly in one
application during Step 4, but otherwise I was able to work normally. It
didn't even seem to be slowing my computer down greatly, although this
is a fairly powerful workhorse, so your mileage may vary.

Please do comment, if you feel I've left anything out in the above, or
indeed if you have found it useful.

Good luck with your upgrade.

