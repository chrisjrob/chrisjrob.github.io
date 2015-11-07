---
layout: page
title: Howto | Send Files by Email
menu: howto
weight: 40
category: technology
tags: [linux]
---

## Explanation

Oddly enough, there is no option, when browsing folders, to right-click and send by email - something Windows users take for granted. Fortunately this omission may be easily corrected as follows.

These instructions are for Kmail, if you are not using Kmail (or KDE Kontact PIM) then these instructions will need to be modified for the command line of your email client.

## Installation

Create the following file and save as "kmail.desktop" in the folder "/usr/share/apps/konqueror/servicemenus" (for all users on your system).

[Desktop Entry]
Encoding=UTF-8
ServiceTypes=all/allfiles
Actions=Email;

[Desktop Action Email]
Name=Send file(s) with KMail
Exec=kmail --attach %F
Icon=kmail
</PRE>

 