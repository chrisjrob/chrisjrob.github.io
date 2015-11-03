---
layout: post
title:  "Building a new mailserver"
date:   2009-05-27 00:00:00
category: technology
tags: [linux, debian, lenny, ltsp, email] 
---

Our Debian Lenny LTSP5 Install has hit a road block: currently the site are using a Citrix server at another location over a 256k connection to pick up their emails.  I really didn't feel that I could ask them all to collect their emails over a 256k connection, so what are the alternatives?  Well I could upgrade the bandwidth by creating an inter-site VPN, but that will still only provide perhaps 600k (that being the upload bandwidth of the host site).  The solution is to move the mailserver onto the 'net, so that they can benefit from a full 8mb ADSL download.

<!--more-->

After seeking advice, I choose [Bytemark](http://bytemark.co.uk) as a trusted Debian VPS supplier, a day later I had my login to my new virtual server.  But what to install?  Advice pointed me in the direction of Postfix and Dovecot, which were not much more than an apt-get install:

   * [Debian Admin Mailserver](http://www.debianadmin.com/debian-mail-server-setup-with-postfix-dovecot-sasl-squirrel-mail.html)

Great, a working mailserver, but the problem with the installation was that the users were local system accounts, which made it more cumbersome to administer.  The best solution seemed to be LDAP, and I duly followed the guide [Debuntu](http://www.debuntu.org/ldap-server-and-linux-ldap-clients) to install, and I managed to integrate LDAP with PAM thus giving me the ability to allow users to login with an LDAP account; but in a nutshell that was exactly what was wrong with this solution - the users *had* to login to the server, before their system account would be created, and if that was the case I might as well have stuck with local system accounts in the first place.  What I needed was a true virtual mail host.  To that end, I was pointed in the direction of a [Ubuntu howto on Howtoforge](http://www.howtoforge.com/postfix-virtual-hosting-with-ldap-and-dovecot-on-ubuntu8.04).

Okay but this was for Ubuntu not Debian and for one reason and another I simply could not get it working.  After starting from scratch a couple of times, but ending up in the same place, I found that I had to combine the howto with [this one for 8.10](http://www.howtoforge.com/postfix-virtual-hosting-with-ldap-backend-and-with-dovecot-pop3-imap-on-ubuntu-8.10).

Even then it took a fair amount of battling to get it working on Debian Lenny.  The key to most of my problems was in reading the comments on every page, as these include invaluable corrections and suggestions.

So after a week of pain, I now have a working virtual mail host, now I just need to set-up the domains, users and mailgroups.

