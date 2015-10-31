---
layout: post
title:  "A quick and dirty install of LibreOffice on Debian"
date:   2010-10-28 00:00:00
categories: technology linux debian
tags: libreoffice
---

Following the forking of OpenOffice.org into LibreOffice under the auspices of the new Document Foundation, I decided that I should take a look.

First I removed OpenOffice:

    $ sudo apt-get --purge remove ".*openoffice.*"

<!--more-->

Then I visited [the Document Foundation LibreOffice website](http://download.documentfoundation.org/libreoffice/testing/) and downloaded:

   * LibO_3.3.0_beta2_Linux_x86_install-deb_en-US.tar.gz
   * LibO_3.3.0_beta2_Linux_x86_langpack-deb_en-GB.tar.gz

Then, having checked that the md5sums matched, I extracted both with `tar -xvvzf` and changed to the DEBS directory in each and ran:

    $ sudo dpkg -i *.deb

All very clumsy, but this was only my work PC, which isn't mission critical, as I generally use NX client to log into my desktop on our LTSP Server.

So what are my first impressions?  Sadly these will have to wait for another day, apart from the obvious branding change, I couldn't see much different, but the good news is that it does all appear to be working.

I am not sure whether LibreOffice yet has the [Go-OO Patches](http://go-oo.org) patches, which I believe were included by default in Debian and Ubuntu, but the fact that they are being combined into the core must be good news.

I am really hoping that LibreOffice improves quickly on OpenOffice, which still falls considerably short of Microsoft Office for power users.  In particular Macros, Pivot Tables, Conditional Formatting, and Mailmerge all need a lot of work.  Not to speak of the appalling performance, it really is a system hog.  I can't help feeling that it really needs to be re-written from scratch, but I appreciate that is unrealistic.

In the meantime I have hopes that KOffice will soon step up to the mark - KWord's mailmerge feature is a lesson in simplicity that OpenOffice/LibreOffice would do well to learn.

