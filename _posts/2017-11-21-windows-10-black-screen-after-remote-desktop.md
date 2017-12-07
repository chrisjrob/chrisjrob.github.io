--- 
layout: post 
title: Windows 10 Black Screen After Remote Desktop
date: 2017-11-21 10:00:00
type: post 
category: technology
tags: [windows, rdesktop]
image: black-window-300.png
published: true
---

I logged into my Windows 10 Professional (1703) desktop from home yesterday, using Remmina on Ubuntu 16.04. 
I wasn't surprised when my desktop wallpaper was black, I know it does this to save bandwidth, but when I returned to the office this morning my desktop was still black and, as it is set by the administrator via GPO, could not be changed.

Searching the Internet was not helpful on this occasion; so I have made this quick posts to help others.

<!--more-->

It turns out that this is not some weird absence of wallpaper, but rather is a plain black wallpaper image, which has managed to get itself cached.
The solution is consequentially simple - find and terminate said cached image.

 1. Open File Explorer and navigate to `%APPDATA%` (you can type that into the top address/location field).
 2. In the search box at the top right enter the text "Cache" (see image below).
 3. Delete the cached version of the black wallpaper once it is found.
 4. Sign out and then sign back in.

On my system the specific file location was:

    %APPDATA%\Microsoft\Windows\Themes\CachedFiles\CachedImage_1920_1080_POS4.jpg
 
Please do comment below if this was helpful, or if you needed to alter these instructions at all.

![File Manager](/assets/black-window.png)
