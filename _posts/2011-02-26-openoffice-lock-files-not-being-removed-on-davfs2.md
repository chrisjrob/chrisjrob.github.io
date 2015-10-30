--- 
layout: post 
title: OpenOffice Lock Files Not Being Removed On DavFS2
date: 2011-02-26
type: post 
published: true 
status: publish
categories: technology linux
tags: openoffice davfs2
---

I have a mystery - I have two Debian Lenny servers both running the same
version of davfs2 and the same version of openoffice.org.  When you open
an openoffice document, openoffice creates a lock file of the same name,
but prefixed with ".\~lock".  This file retains a copy of the document
until you save and exit, whereon it is removed automatically.

The mystery is that, at one of our branches, it reduces size to 0, but
is never actually removed; after which time the file cannot be edited
until that lock file is manually removed.

<!--more-->

Both servers have the same `davfs2.conf` and I have done a diff between
the two servers:

    # for file in `find /usr/lib/openoffice/ -name *.xcs -type f`; \
      do echo "=== $file ==="; \
      ssh root@other-server "cat $file" | diff $file - ; \
      done

But there are no differences.  I have checked users' `davfs2.conf` files,
but these are all commented out entirely.

Previously I had "fixed" this problem, by setting UseDocumentOOoLockFile
to false in:

    /usr/lib/openoffice/basis3.2/share/registry/schema/org/openoffice/Office/Common.xcs

This doesn't stop the lock files being created, but it does tell
Openoffice not to worry about them.  Unfortunately this no longer seems
to be working, and I really can't understand why.

Currently I have "fixed" the problem by setting `davfs2.conf` to:

    use_locks 0

This is now allowing the lock files to be removed properly.  I believe
that actually this will work quite well, with the `UseDocumentOOoLockFile`
set to true, given that 99.9% of our documents are Openoffice documents.
 Always assuming I can persuade Openoffice to obey its own registry!

