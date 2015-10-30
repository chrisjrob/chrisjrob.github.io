--- 
layout: post 
title: FreeNX NX Startup Session Failed
date: 2014-01-02
type: post 
published: true 
status: publish
categories: technology
tags: 
---

Occasionally users are unable to connect to our FreeNX server, they
report an error "Startup Session Failed". Clicking on "Detail" shows
that it is unable to find the server session file.

Searching for solutions suggested a number of options, including
removing the server `/tmp/.X1\*\*\*-lock` files, or simply removing FreeNX
and installing NoMachine's NXServer instead.

In the end the solution proved remarkably simple:

<!--more-->

On the server run:

    # nxserver --list
    NX> 100 NXSERVER - Version 1.5.0-60 OS (GPL)
    NX> 127 Sessions list:
    Display Username Remote IP Session ID
    ------- --------------- --------------- --------------------------------
    1001 chris 192.168.1.52  1BC6B4B9C3CF4C2B6BD7137AC7FDE5DA
    1000 helen -             87443D16622EC0751551685A93DD023B
    1002 michelle 192.168.1.102 DBAC430C8AA8B414A5E2228970E2BBDC
    NX> 999 Bye

The session with no remote IP is for a session that has not ended
properly. Terminate this session and users should be able to log in once
again:

    # nxserver --terminate helen

**Update:** This problem was little more complex than I at first
thought, all I had really done is allow one more user to login before
the issue re-occurred. You also need to check is that there are no old
lock files in /tmp/.X11-unix:

    # cd /tmp/.X11-unix
    #ls -al
    /tmp/.X11-unix# ls -al
    total 316
    drwxrwxrwt   2 root root      4096 2014-01-02 12:48 .
    drwxrwxrwt 375 root root    315392 2014-01-02 12:48 ..
    srwxrwxrwx   1 root root         0 2013-07-24 17:04 X0
    srwxrwxrwx   1 helen helen       0 2014-01-02 10:32 X1000
    srwxrwxrwx   1 chris chris       0 2014-01-02 11:42 X1001
    srwxrwxrwx   1 michelle michelle 0 2014-01-02 08:52 X1002
    srwxrwxrwx   1 terry  terry      0 2013-09-05 15:05 X1003

Notice that there is a .X11-unix file for terry X1003, but no
corresponding user shown in nxserver --list above. Remove this spurious
file and it should now work.

It would also make sense to ensure that the correct /tmp/.X1\*\*\*-lock
files are present:

    # cd /tmp
    # ls -al | grep -i X.*-lock
    -rw------- 1 nx nx              0 2014-01-02 10:32 .nX1000-lock
    -rw------- 1 nx nx              0 2014-01-02 11:42 .nX1001-lock
    -rw------- 1 nx nx              0 2014-01-02 08:52 .nX1002-lock
    -r--r--r-- 1 helen helen       11 2014-01-02 10:32 .X1000-lock
    -r--r--r-- 1 chris chris       11 2014-01-02 11:42 .X1001-lock
    -r--r--r-- 1 michelle michelle 11 2014-01-02 08:52 .X1002-lock

You should expect to see  the correct number of lock files for your user
sessions,  in my case these required no changes, but if there had been
spurious files, removing them would seem sensible.

If this has been helpful to you, please do consider rating this post or
adding a comment!

