---
layout: post
title:  "Home Theatre PC - Continued"
date:   2010-09-21 00:00:00
category: technology
tags: [linux, mythtv, htpc]
---

I've been asked recently for an update on how my HTPC is performing.  Well the good news is that we are now using it as our main system, and pretty much everything is working perfectly, including:

<!--more-->

   * Live TV - Pause Rewind etc
   * Programme Guide
   * Schedule Recordings
   * MythVideo (for ripped DVDs)
   * MythWeb (personal webpage for controlling Myth and viewing programme guide)

The best news is that Audio is now working over HDMI; although to be honest, I don't believe I ever fixed this, so I suspect I just hadn't tested it properly.  All I did was select the Audio over HDMI setting in KDE Control Centre and it just worked.

So what is left to fix?

   * System does not shutdown automatically - this is normal behaviour for MythTV, but I prefer to have it shutdown when not in use.  This is a neat feature actually, as it will literally completely shutdown with a timer set in the bios to come on for the next schedule.  Hopefully I can sort this out soon.
   * MythTV Backend needs to be restarted every time the machine is powered up - this is a known issue and may even have been sorted; having been without Internet for the past three weeks, I have no idea where we are.  Basically on first boot we just type `$ sudo service mythtv-backend restart`.  Obviously if there is no fix, it would be simple enough to add to the start-up process. [Subsequently fixed]({% post_url 2010-10-14-home-theatre-pc-continued %}).
   * My card has dual tuners, so can record one thing and watch another, or record two things.  I have now read that some channels are on the same "mux" and that you can therefore record multiple programs on a single card.  I need to research this further, but sounds exciting.
   * For some reason it is not saving a bookmark when you stop watching a recorded program in the middle, so that you have to find where you were manually.  This worked fine on our old machine, so just need to find out what is wrong.  I can research this when I have time. [Subsequently fixed]({% post_url 2010-12-05-home-theatre-pc-continued %}).
   * The case fans are a little noisier than they ought to be, so really need replacing for silent alternatives.

And, not MythTV related, but I am still struggling with KDE4, Akonadi and our Contacts in Kontact.  I suspect this may be related to the use of MySQL for both MythTV and Akonadi.  In the meantime my wife is using Gmail, but obviously would prefer to have Kontact back.

