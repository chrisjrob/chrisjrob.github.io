--- 
layout: post 
title: Automatically Process New Files With Fsniper
date: 2011-02-24
type: post 
published: true 
status: publish
categories: technology linux
tags: cli fsniper
---

I had never heard of fsniper until it was mentioned in a mailing list
today, but it sounds excellent:

[Linux.com :: Automatically process new files with fsniper](http://www.linux.com/archive/feature/150200)

Now I am wondering if I can use it to prompt an rsync to sync our shared
documents to our remote site, and [it seems I could](http://bio-geeks.com/?p=662 "Bio-Geeks").  This is a major
headache for me, as we have two branches and a shared documents
repository.

<!--more-->

I have previously tried using [Unison](http://www.cis.upenn.edu/~bcpierce/unison/ "Unison File Syncrhonizer")
to synchronise between the branches, but this has created a lot of load
on the master server, massively slowing down performance for all the
users on the master server.

We are currently using apache2+webdav+svn but this is not working well
for us.  Potentially fsniper+rsync could work very well.  It would
clearly need to be running on both servers and I can see a potential
clash if the two servers happen to try and update the same file at the
same time.  More thought is required, any suggestions - do let me know.

The links to the fsniper site seem to be outdated in both of the above
articles, but it may be found at:

<http://freshmeat.net/projects/fsniper>

It doesn't appear to be packaged for Debian, but I will probably compile
from source and try it soon.  More later!

