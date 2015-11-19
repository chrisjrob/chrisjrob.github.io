---
layout: post
title:  "Unison File Synchronisation"
date:   2008-10-27 00:00:00
category: technology
tags: [linux, unison, sync]
image: unison_logo.png
---

One of the few things that we miss from the old Microsoft days is the "briefcase".  In particular our MD used it every day and loved it.  On Linux the best open source alternative is probably Unison File Synchroniser.

I got this working a few weeks ago and it was incredibly simple to get working and a joy to use.  I personally didn't really have a need for this software, but now that it's installed it just so convenient that I am finding myself using it regularly.

<!--more-->

My first set-up was with my home laptop ([Kubuntu](http://www.kubuntu.org/)) and our work server ([Debian](http://www.debian.org/) Etch).  I simply did an `apt-get install unison` on the server and `apt-get install unison unison-gtk` on the laptop.  The gtk gui is of course optional, Unison is perfectly happy working from the command line, and it does have the benefit then of being able to automate the process to some extent.

On the laptop, I created a directory "unison" under my home to use as my local store and ditto on the server, so that I had `/home/chris/unison` on both home and server (they don't have to be the same username or path).

I then ran Unison from the Utilities menu, which prompted me for the local dir - which I entered as `/home/chris/unison`.  It then prompted me for the remote dir, which protocol I wanted to use (I selected ssh), the hostname and user account of the server.

It then prompted me for my user account's password and then warned me that the directories were both empty and that it was assuming that this was the first time I had done a synchronisation.

I then tested by putting a file in the local directory and running unison again, and sure enough it synced up to the server.

Job done.

Unfortunately our MD had bought himself a MacBook.  Grrr.  Fortunately [Unison is available for the MacBook][UnisonMac], and it has a gorgeous GUI.  A quick install and, disaster, "fatal error" on synchronisation and an helpful warning that the client/server versions might be incompatible, but a quick `apt-get -t etch-backports install unison` resolved that problem in a trice, all now working beautifully.

I think there's a Windows version as well, but no-one really runs Windows these days, so that's probably of no interest ;-).

   * [Unison File Synchroniser][Unison]
   * [Mac Version][UnisonMac]

One thing that our MD likes is to have a single directory on his desktop that has links to all the files around the system that he likes to monitor daily.  The problem is that Unison will only synchronise the link, not the file itself, and of course the link won't work remotely.

The solution is to edit the `~/.unison/default.prf` file and add the following line (client end only):

    follow = Regex .*

Unison will now follow the symbolic links (not .desktop files - only actual symbolic links) and sync the file to which they point.  (On a MacBook this `.prf` file is under `~/Library/Application Support/Unison`, or somewhere close to that anyway!)

Update: I have written these instructions into a simple howto:

   * [Howto &#124; Synchronise files with Unison]({% post_url 2009-03-21-synchronise-files-with-unison %})


[Unison]: http://www.cis.upenn.edu/~bcpierce/unison/
[UnisonMac]: http://www.cs.haifa.ac.il/%7Eshuly/unison/
