---
layout: post
title: Howto | Apache SSL
menu: howto
date: 2009-05-19 12:02:19
weight: 40
category: technology
tags: [howto, linux, cli, apache, ssl]
---

    # a2enmod ssl
    # cd /etc/apache2/
    # mkdir ssl
    # openssl req -new -x509 -days 3650 -nodes -out /etc/apache2/ssl/apache.pem -keyout /etc/apache2/ssl/apache.pem
    # chmod 600 /etc/apache2/ssl/apache.pem
    # /etc/init.d/apache2 restart

**When generating the certificate it prompts for "Your name", this should be the name of your site e.g. host.example.com.**

    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/apache.pem
