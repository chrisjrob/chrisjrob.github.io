--- 
layout: post 
title: Sleeping Better with Linux
date: 2015-11-15 19:28:00
type: post 
category: technology
tags: [health, linux, ubuntu]
image: flux-icon-big.png
---

I was reading [Phones need 'bed mode' to protect sleep][bbc] on the BBC, that computers should have a blue light filter to help people to sleep properly at night. 
As I am frequently working on my laptop until late in the evening, I felt that I should investigate further. 
Currently I do turn down the brightness, but it seems that is not enough.

<!--more-->

The article linked to a program called [f.lux], which is free for Linux.
I also came across this article on Linux Magazine [Avoiding Eye Strain].

## Installation

Getting this working on my laptop was trivial:

    sudo add-apt-repository ppa:kilian/f.lux
    sudo apt-get update
    sudo apt-get install fluxgui

Finally I ran the program and set it to launch on start-up. 
I entered latitude as 51.2, which is close enough I believe.

## Operation

The software feels fairly basic, whether this is the same for Windows and Mac I don't know. 
That said the applet seems to run perfectly in the Ubuntu notification area.

It is very noticeable that the display is more muted and much more comfortable to view in the evening. 
I don't yet know whether this will work well during the day, nor whether it will improve my sleeping.
But the logic behind it seems sound and there is no reason why it shouldn't help.

[bbc]: http://www.bbc.co.uk/news/health-34744859
[f.lux]: https://justgetflux.com/
[Avoiding Eye Strain]: http://www.linux-magazine.com/Online/Features/Avoiding-Eye-Strain
