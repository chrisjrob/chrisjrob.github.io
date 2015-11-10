---
layout: post
title: Howto | Install WebDAV on ISPConfig
menu: howto
date: 2009-03-21 06:16:34
weight: 40
category: technology
tags: [howto, linux, ispconfig, webdav]
---

## Step 1: Create a web

This is not an ISPConfig tutorial, so it is supposed that you know how to do this.

**Use the ISPConfig web interface.**

**Probably sensible to make the site a maximum size.**

<!--more-->

## Step 2: Create data folder

    $ mkdir /var/www/webXX/web/webdav
    $ chown webXX_trident:webXX /var/www/webXX/web/webdav
    $ chmod o+w /var/www/webXX/web/webdav

## Step 3: Create lock folder

    $ mkdir /var/www/webXX/DAVlocks
    $ chown www-data:www-data /var/www/webXX/DAVlocks
    $ chmod o+w /var/www/webXX/DAVlocks

## Step 4: Download and install 

    $ apt-get install libapache-mod-dav
    $ a2enmod dav
    $ a2enmod dav_fs

## Step 5: Create user

    $ htpasswd -c /var/www/webXX/.DAVlogin username

## Step 6: Add Apache Directives to ISPConfig site

**Use the web interface and browse to Sites.**

    DavLockDB /var/www/webXX/DAVlocks/DAVlocks
    Alias /webdav /var/www/webXX/web/webdav
    <Location /webdav/>
        DAV On
        AuthType Basic
        AuthName 'username'
        AuthUserFile /var/www/webXX/.DAVlogin
        <LimitExcept GET POST PUT DELETE CONNECT OPTIONS PATCH PROPFIND PROPPATCH MKCOL COPY MOVE LOCK UNLOCK>
            Require valid-user
        </LimitExcept>
    </Location>

Restart apache service.

## Step 7: Install Cadaver for testing

    $ apt-get install cadaver
    $ cadaver http://webdav.tridentgarages.co.uk/webdav/
    Username: username
    Password: p455w0rd
    dav:/webdav/> put test.file
    dav:/webdav/> ls
    dav:/webdav/> get test.file

