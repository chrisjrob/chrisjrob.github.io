---
layout: post
title: Howto | Copy Directories & Preserve Permissions
menu: howto
date: 2009-03-21 05:58:15
weight: 40
category: technology
tags: [linux, cli]
---

## The Command

    $ cd /
    $ tar cf - opt | (cd /archive; tar xf - )

**You cannot run this command as "sudo", if you need root access for your copy, then you will need to execute a "sudo su" or log in as root.**

## What the command will do

With any command that you are given by someone, you should always check what that command will do:

    $ tar cf - opt | (cd /archive; tar xf - )
    c = create
    f - = file stdout
    opt = source path
    | = pipe all above to...
    (
    cd /archive;
    x = extract
    f - = file stdin
    )

So this command will pipe a new archive from opt to stdout, which it will then recreate in /archive.

This  will copy `/opt` into `/archive/opt`, preserving permissions, file modification times etc.

Read man tar for more details.
