---
layout: post
title:  "Installing Nagios on Debian Lenny"
date:   2009-10-16 00:00:00
categories: technology linux
tags: nagios
---

Turns out this is as simple as:

    $ sudo -i
    # apt-get install nagios3
    # cd /etc/nagios3
    # htpasswd -c htpasswd.users nagiosadmin

Then point your browser at [http://localhost/nagios3/](http://localhost/nagios3/).
