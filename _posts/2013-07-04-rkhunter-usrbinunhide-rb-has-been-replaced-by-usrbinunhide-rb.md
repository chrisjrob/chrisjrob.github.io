--- 
layout: post 
title: Rkhunter Usrbinunhide Rb Has Been Replaced By Usrbinunhide Rb
date: 2013-07-04
type: post 
published: true 
status: publish
categories: technology
tags: 
---

I have recently moved over to Rootkit Hunter (rkhunter) instead of using
fcheck, one issue that I encountered on all our Ubuntu servers was the
error:

    Warning: The command '/usr/bin/unhide.rb' has been replaced by a script: /usr/bin/unhide.rb: Ruby script

Googling confirmed that this error was normal on Ubuntu systems, but I
found no solution. Fortunately the solution was simple, simply editing
/etc/rkhunter.conf and adding the following line at the appropriate
place:

    SCRIPTWHITELIST=/usr/bin/unhide.rb

 

