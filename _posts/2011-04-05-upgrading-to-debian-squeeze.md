--- 
layout: post 
title: Upgrading To Debian Squeeze
date: 2011-04-05
type: post 
published: true 
status: publish
categories: technology linux debian
tags: upgrade
---

I finally decided to upgrade my work desktop to Debian Squeeze.

Preparing for the Upgrade
-------------------------

I manually removed all but the official lenny repositories (and removed
the Debian Volatile repository which is no longer used), and updated
them to "squeeze":

    $ sudo vim /etc/apt/sources.list
    deb http://91.121.125.139/debian/ squeeze main non-free contrib
    deb-src http://91.121.125.139/debian/ squeeze main non-free contrib

    deb http://security.debian.org/ squeeze/updates main non-free contrib
    deb-src http://security.debian.org/ squeeze/updates main non-free contrib

Next, in order to minimise download time, I reviewed my installed
packages:

    $ sudo dpkg -l | grep "ii " | less

And I removed all the unnecessary packages. In particular I decided to
remove all of KDE, as I am now using pekwm. When removing packages I
found apt-get kept trying to upgrade large numbers of packages. Aptitude
was much better, as instead of just trying to install a load of
packages, it reported the problem (e.g. package XYZ will be broken by
this change) and let me choose the solution. I just added the packages
that would be broken to the list of packages to be removed.

Upgrade apt and dpkg
--------------------

Then I installed apt and dpkg, to save these from having to be upgraded
during the upgrade process:

    $ sudo apt-get update
    $ sudo apt-get install apt dpkg

Upgrade to Squeeze
------------------

Lastly, I ran the upgrade to squeeze with:

    $ sudo apt-get dist-upgrade

During the upgrade I receive warnings about `/lib/firmware/e100`
missing. Mindful of the Debian's much touted removal of non-free
drivers, I did an `apt-file search e100` which revealed that I needed to
install the `firmware-linux-nonfree` package. This done, I rebooted.

First Boot
----------

It booted fine to the command prompt, but of course without a login
manager it got no further. I simply typed startx to get into pekwm and
it all worked perfectly.

Installing KDE
--------------

I decided to install KDE again, although I would struggle to explain
why, curiosity perhaps. I installed kde-core and it all just worked
perfectly, with a neat first time wizard to handle the migration of
configuration from KDE3.5 to KDE4, excellent work.

I used KDE4 for a few hours before returning to pekwm.

Conclusions
-----------

So far Squeeze has been flawless and yet another Debian dist-upgrade
without a hitch. Well done Debian.

KDE looks great and seemed to work exactly as it ought. Over the few
hours I encountered no problems whatsoever. But I do wish KDE would
learn from some of the features of PekWM - I just love the
left-mouse-click on the screen edge to move to the next window, I love
the ability to group windows and I love the fact that you can resize
windows to fill the available space.

I am not saying that all those features should be made the default in
KDE, such matters are subjective, but they ought to at least be possible
in KDE and as far as I can tell they are not. There is a screen edge
option, but it works poorly, relying on you holding the mouse at the
screen edge for a definable period of time.

