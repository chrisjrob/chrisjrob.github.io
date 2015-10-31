---
layout: post
title:  "Home Theatre PC - Configuring Hauppauge HVR2200 TV Card"
date:   2010-05-22 00:00:02
categories: technology linux mythtv
tags: nvidia hauppage hvr2200
---

<img src="/assets/hvr2200_board_s_200.jpg" class="image-right" alt="Hauppauge HVR2200">

Wow, this really is a second post in one day!

Following on from the DPI issue, I decided to throw science to the wind and just set DPI to 96x96 rather than 50x50, and the login screen looks better and the font size is improved (slightly larger).

<!--more-->

Next, I decided that I ought to check that the TV Tuner was properly detected, but whilst it was detected correctly, it was unsure of the card number, and was unable to download the firmware.  This is not entirely surprising as this TV card is fairly recent and (as usual) Hauppauge do not themselves support Linux.

[This link](http://ubuntuforums.org/showpost.php?p=9219191&postcount=212) provided me with the basis for fixing this issue, but in the event I only needed the following:

    $ cd ~
    $ wget http://www.steventoth.net/linux/hvr22xx/22xxdrv_27086.zip
    $ wget http://www.steventoth.net/linux/hvr22xx/HVR-12x0-14x0-17x0_1_25_25271_WHQL.zip
    $ wget http://www.steventoth.net/linux/hvr22xx/extract.sh
    $ sh extract.sh
    $ sudo su
    # cp *.fw /lib/firmware/`uname -r`/
    # echo "options saa7164 card=4" >> /etc/modprobe.d/options.conf
    # exit

Then reboot.  Hopefully tomorrow I will have some time to continue setting up the TV card under MythTV; but for now the aerial input is required by our old MythTV system in order to record Doctor Who :).

