--- 
layout: post 
title: Rkhunter /usr/bin/unhide.rb has been replaced by /usr/bin/unhide.rb
date: 2013-07-04
type: post 
published: true 
status: publish
category: technology
tags: [linux, ruby, rkhunter, rootkit, unhide, security]
---

I have recently moved over to Rootkit Hunter (rkhunter) instead of using
fcheck, one issue that I encountered on all our Ubuntu servers was the
error:

    Warning: The command '/usr/bin/unhide.rb' has been replaced by a script: /usr/bin/unhide.rb: Ruby script

<!--more-->

Googling confirmed that this error was normal on Ubuntu systems, but I
found no solution. Fortunately the solution was simple, simply editing
`/etc/rkhunter.conf` and adding the following line at the appropriate
place:

    SCRIPTWHITELIST=/usr/bin/unhide.rb

 

