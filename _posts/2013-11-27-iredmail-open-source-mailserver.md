--- 
layout: post 
title: iredmail Open Source Mailserver
date: 2013-11-27
type: post 
published: true 
status: publish
category: technology
tags: [linux, mailserver, imap, ldap]
---

<a href="http://iredmail.org"><img src="/assets/dashboard_300.png" class="image-right" alt="iRedmail"></a>

Whilst the world seems to be moving email to "The Cloud", rightly or
wrongly I remain reluctant to give up the control of our own mailserver.
For over ten years now we have been using a combination of the following
open source applications:

   * Postfix MTA with Amavis + Spamassassin
   * Dovecot IMAP server
   * OpenLDAP

<!--more-->

Whilst these are super-stable and bulletproof solutions, the main issue
with such a solution is the administration - setting up users, changing
passwords, vacation notifications, sieve etc. It is also a lonely
business administering a custom mailserver, where set-up is never going
to be completely standard.

A couple of years ago I migrated to a new mailserver, on which I
installed [iRedMail](http://iredmail.org/ "iRedMail"). iRedMail is a
pre-packaged mailserver solution, based on all the software that I was
using already (Postfix, Dovecot, OpenLDAP), but with the benefit of a
slick admin panel that pulls it all together and provides ongoing
support. It also incorporates Roundcube for webmail, undoubtedly
prettier than Squirrelmail, which we were using before. iRedMail even
includes a pre-configure Fail2ban, essential to protect your
internet-facing server from attack.

<img src="/assets/dashboard.png" alt="The iRedmail Dashboard">

There are two web administration panels to choose from - the free and
open source panel and the Pro panel. Both interfaces are attractive and
functional, but predictably the Pro panel has more functionality [at a
price](http://iredmail.org/pricing.html "iRedMail pricing"). Some would
call this Crippleware, but bear in mind that the server itself has full
functionality - this is merely the configuration of that server. If you
are happy to configure LDAP yourself, then you don't strictly need to
use the Pro panel. See *"Features and Comparison"* half way down [this
page](http://iredmail.org/admin_panel.html "Features of iRedAdmin"). Whilst
the Pro panel does come with the source code, the developer explicitly
restricts your right to distribute.

Installation is very fast - but must be on a fresh server - I tried to
upgrade from an existing Postfix install and it ended badly. Updates are
delivered as a web page of instructions, which I have come to prefer to
running an upgrade script, as you can intelligently decide whether you
are happy with each change proposed. The downside is that you could
easily miss a step and leave your server only partially "upgraded".

Whilst the forums are quiet, the developer is very responsive to posts
and has dealt efficiently which each issue that I encountered. Roundcube
has proven to be a very attractive webmail interface and includes Sieve
administration for server-based filtering and vacation notices.

Overall we are very happy iRedMail users - if there is an easier way of
running an Open Source mailserver, I have not discovered it.

