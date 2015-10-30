--- 
layout: post 
title: Crontab Header
date: 2014-01-04
type: post 
published: true 
status: publish
categories: technology
tags: 
---

[![Image]({{%20site.baseurl%20}}/assets/crontab.png?w=487)](http://chrisjrob.files.wordpress.com/2014/01/crontab.png)

Very early on in my Linux life, I came across this suggested header for
crontab and I've used it ever since. So much so that I am always
slightly thrown when I come across a crontab without it! No, you don't
need it, yes the standard commented header works just fine, but, if like
me you prefer things neatly lined up, then this might suit you:

<!--more-->

    MAILTO=
    #   _________________________ 2. Minute - Minutes after the hour (0-59)
    #  |
    #  |      ______________________ 2. Hour - 24-hour format (0-23).
    #  |     |
    #  |     |      ___________________ 3. Day - Day of the month (1-31)
    #  |     |     |
    #  |     |     |      ________________ 4. Month - Month of the year (1-12)
    #  |     |     |     |
    #  |     |     |     |     ______________5. Weekday - Day of the week. (0-6, 0 indicates Sunday)
    #  |     |     |     |    |
    #__|_____|_____|_____|____|___Command_____________________________________________________________

And if you recognise this as your's, then thank you!

