---
layout: post
title:  "May the source be with you"
date:   2009-06-09 00:00:00
category: technology
tags: [linux, floss]
---

From time to time I see the comment advocating a closed source program, with the response *"as I'm not a developer it doesn't bother me whether or not I have the source code"*.   I believe that that view is wrong, and that there are many occasions where non-developers will find benefit from having access to the source code.

<!--more-->

For example,I've just found that Kmail will not auto-complete email addresses from an LDAP KDE resource.  A [simple bug][1]; although strictly speaking it's not a bug, as it was a deliberate feature.  Fortunately [there is a fix][2],  with a modification made to one of the components.  Unfortunately this fix has not found its way into Debian Lenny or Squeeze, and Sid is now KDE4. 

I could install from the KDE SVN repository, but that version has not been tested with Debian, and I don't really want to have such a significant part of a production server to have come from outside of Debian.  Perhaps I am being overly cautious.

Anyway, I changed to `/usr/src` and ran `apt-get source kdepim` to download the source from Debian.  I used "find" to locate the offending component, and used diff to determine what differences there were between the modified KDE version and the standard Debian version.  I was pleased to note that only one line had changed.  I copied in the new component and ran `apt-get build-dep kdepim` (with help from Dominic in #surrey).   Then a quick `./configure`, a very slow "make", and a quick `sudo checkinstall make install` and the fix was made.

There are many many more benefits to open source than the ability to modify the source, but I just wanted to point out that, even for non-developers, there is a very real and very direct benefit to having the source.

May the source be with you.

[1]: http://bugs.kde.org/show_bug.cgi?id=146247
[2]: http://websvn.kde.org/?view=rev&revision=800071

Update - the actual patch may be found [here](http://goo.gl/FbHwh).

