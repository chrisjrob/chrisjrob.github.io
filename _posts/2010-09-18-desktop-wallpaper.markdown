---
layout: post
title:  "Desktop Wallpaper"
date:   2010-09-18 00:00:03
categories: technology linux ltsp
tags: wallpaper
---

When I launched our first LTSP server, I was very keen to make the system as pleasurable for the users as possible; to this end, I left users able to customise their desktop pretty much how they liked.  I decided that this free-for-all had gone too far, when I saw customers sitting in front of one user's computer, sporting a desktop wallpaper of his baby son.  At the time I just set a system default of a fairly neutral blue / dark blue radial gradient, and put an item on my to-do list to create a desktop wallpaper.

<!--more-->

Those who read [my earlier post regarding KDE Wallpaper]({% post_url 2010-06-26-kde-wallpaper %}) may have seen examples, and basically I created a red background with company logo and a few lighting affects, making suitable wallpapers for most of the common screen sizes.  It was when I went to implement these wallpapers that I realised that I had a problem - KDE only allows you to force one single wallpaper to all users, regardless of screen size.  I could allow the users to set their own wallpaper, from a select list, but it would be impossible to restrict them only to that list.  And what if they hop from one computer to another - the screen size will be wrong again.  No, I needed a way of changing the wallpaper at login to the correct wallpaper for their screensize, and that meant a perl script running at login.  The task could be broken into three parts:

 1. Determine screen size
 2. Choose best wallpaper
 3. Set wallpaper

To determine the screen size, I used a small Perl Tk routine:

    sub get_screen_size {
            use Tk;
            my $mw=tkinit;
            $mw->withdraw;
            return($mw->screenwidth, $mw->screenheight, $mw->screendepth);
    }

To select the best wallpaper, I found this far more complicated that I would have liked - the issue is that NX users have screen sizes that are non-standard, so I couldn't rely on exact matches.  In any case, if I relied on perfect matches I would have been creating new wallpapers for each and every obscure monitor resolution.  The best approach I found was to score each wallpaper based on aspect, width and height, calculating the percentage error for each compared to the users screen size, summing the errors and picking the wallpaper with the lowest error.  Logically aspect would be far more important that the other errors, so I trebled the aspect error to make that the dominant criteria.

Lastly, I set the wallpaper using a simple dcop command:

    `dcop kdesktop KBackgroundIface setWallpaper "$newwallpaper" 6`;

After testing it thoroughly, I inserted a shortcut to the script in all users' Autostart directories last night.

I arrived this morning to the comment *"it's a bit bright any chance we could tone it down a bit"*.

I was very polite.

