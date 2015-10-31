---
layout: post
title:  "Etherpad on Debian Squeeze"
date:   2011-02-07 00:00:00
categories: technology linux debian
tags: etherpad
---

<img src="/assets/etherpad.png" class="image-right" alt="Etherpad">

Just installed [Etherpad] on our openvz server.  Having created an openvz guest for the purpose, running Debian Squeeze, installing Etherpad proved no more difficult than adding the Etherpad repository to your `/etc/apt/sources.list`:

<!--more-->

    $ sudo su
    # echo "deb http://apt.etherpad.org all ." &gt;&gt; /etc/apt/sources.list
    # apt-get update
    # apt-get install etherpad

All the requisite dependencies were brought in.  Unfortunately the etherpad server did not start after installation, and I had to do the following commands:

    # sed -i.orig 's/local/share/' /etc/init.d/etherpad

Then it started perfectly simply with `/etc/init.d/etherpad` start.

To make this happen automatically on boot:

    # update-rc.d etherpad defaults

If you would prefer to use openjdk than sun-java (and you should), then google for "etherpad openjdk".  Sorry to say I was in too much of a hurry on this occasion.


### References

   * [Etherpad]
   * [http://sis.bthstudent.se/2011/525/how-to-install-etherpad-on-debian-lenny/](http://sis.bthstudent.se/2011/525/how-to-install-etherpad-on-debian-lenny/)

[Etherpad]: http://etherpad.org/

