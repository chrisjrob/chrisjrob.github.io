---
layout: post
title: Linux | Windows for Linux
menu: linux
date: 2009-03-21 05:31:36
weight: 40
category: technology
tags: [linux, windows]
image: linux-tux.jpg
---

## Introduction

Coping with Windows applications on Linux is probably the biggest problem that you will face.  Your options are:

 * [Install on Linux](#install-on-linux)
 * [Use a Linux alternative](#use-a-linux-alternative)
 * [Install under Wine](#install-under-wine)
 * [Publish to Linux desktop](#publish-to-linux-desktop)
 * [Virtualise](#virtualise)

<!--more-->

## Install on Linux

This may be a waste of time, but it's at least worth checking whether your favourite applications have a Linux version.

## Use a Linux alternative

You definitely should investigate open source alternatives, some of the applications currently available under Linux are simply stunning.

 * http://www.osalt.com/
 * http://linuxappfinder.com/
 * http://www.tuxsoftware.com/

The following applications are particularly good:

## Office suite

Options:

   * OpenOffice - more like Microsoft Office than Microsoft Office 2007
   * KOffice - fast but less compatible with Microsoft Office

Benefits:

   * OpenOffice comes in for a fair amount of criticism for being slow, but on modern hardware this is simply not a problem
   * Openoffice is also criticised for trying too hard to emulate Microsoft Office, but for users used to Microsoft, this is a huge advantage
   * Includes built-in PDF support with automatic creation of PDF bookmarks (gorgeous)
   * Almost 100% compatible with Microsoft Office
   * Already compatible with Office 2007 (which you cannot say for Microsoft Office 2002)
   * OpenOffice Drawing has no Office equivalent and is simply superb for flow charts
   * OpenOffice is free - and versions are available for Windows and Linux

**Currently using Windows?  Ease the transition by installing OpenOffice on your existing Windows server.  And encourage your users to install it at home!**

## PIM/Email

Options:

   * Evolution
   * Kontact
   * Thunderbird (email only)

Benefits:

   * Both Evolution and Kontact have their proponents and their detractors, but the truth is that both these applications do a superb job of replacing Outlook
   * Evolution is probably the only option if you are wedded to Microsoft Exchange Server, and is more unified
   * Kontact is really a suite of programs beautifully welded together into a single application, but nevertheless they are separate and this does effect usability
   * Thunderbird is available for Windows and Linux

Our MD was passionate about Microsoft Outlook, but was swiftly reassured following a demonstration of Evolution and Kontact.  Any small misgivings remaining were dispelled once he realised how much faster Kontact was able to download, sort and filter his messages.

**If you don't require a full PIM, then Mozilla Thunderbird is probably the best mail-only client, and you could install it on your existing Windows server to get your users used to it!**

## Web Browser

   * Firefox (called Iceweasel under Debian) is a superb browser and is available for Windows and Linux
   * Konqueror is fast, but, currently at least, problematic with certain plug-ins

However good Firefox undoubtedly is, you will always have the odd website that simply does not work on anything except Internet Explorer.  If you're really unlucky, this will effect a website that is mission-critical for you.  You have been warned.  Fortunately Firefox is achieving market penetration levels which is forcing webmasters to take notice, so things can only get better.

One particular issue is any website still using Active-X, which is simply not supported on Linux.  Fortunately the world seems to agree that Active-X is about the worst thing ever to come out of Redmond, so its impact is on the wane.

**Install Firefox on your Windows server to familiarise your users before their transition to Linux**

## Desktop Publishing

   * Scribus is absolutely brilliant.
   * Having used QuarkXPress, I found Scribus easier to use and the built-in PDF support fantastic.
   * Scribus is available for Windows and Linux

**Make sure you install the development branch "scribus-ng" rather than the standard version, as the standard version is almost unusable.**

**Scribus is free - so why not give it to all your users?**

## Install under Wine

`Wine` is not an emulator, rather it is a collection of Linux-compatible Windows libraries.  This means that applications installed under Wine are running natively, and in my experience some applications actually run faster than under Windows.

Since the transition to version 1, Wine has become very much more effective a tool and applications that were buggy under Wine have suddenly become much more usable.  That said, my advice to anyone is to try Wine for each application and then give up if it doesn't work well.  Don't do what I did, which was spend weeks of my life and still end up with something less than usable.

Depending on the importance of the application, you could also consider [Crossover Linux by Codeweavers](http://www.codeweavers.com/products/cxlinux/).  They offer Microsoft Office for Linux and have worked to get Wine working better for many applications.  As I understand it, they are actually using an older version of Wine than currently available from WineHQ, so sometimes applications will work better under Wine than under Crossover Linux (at least so I have been told).  They are a commercial entity, so if you are a large organisation you may be able to pay Crossover to get a particular application working for you.

Internet Explorer is available from [IES4Linux](http://www.tatanka.com.br/).  This worked superbly well for us, until recently when it started hogging vast amounts of CPU, and we had to remove it from all users.  Reaches the websites that Firefox cannot reach, but probably cannot be relied upon for mission-critical use; so if you simply have to have Internet Explorer this is probably not your best option.

**IES4Linux requires a Microsoft Windows licence for each user, which, unless you have lived on the moon for the past decade, you should be able to provide.  There is at least a question-mark over this licensing, so you should make your own enquiries - start at the IES4Linux website.**

## Publish to Linux desktop

Applications can be published from a Windows server to the Linux desktop:

   * Rdesktop
   * Citrix
   * 2x
   * SeamlessRDP

### Rdesktop

   * http://www.rdesktop.org/

On the positive side, Rdesktop is open source, and is a robust application.  It's probably already installed on your Linux system, and, if not, is only an apt-get away.  If it is already installed, then simply typing "rdesktop *serverip*" will give you a login screen, so this is by far the simplest option available.  By itself, Rdesktop is only going to provide you a Windows desktop within your Linux desktop.  I.e. you will end-up with a desktop within a desktop.  This can be confusing for users, particularly those just learning to cope with Linux.  It's also less secure than providing access to the applications only.

**If you are planning an LTSP roll-out and you wish to use this rdesktop-only option, then consider using a screen-script to bypass the Linux desktop and give you a Windows logon instead**

### Citrix

   * http://www.citrix.com/

Installed on a Windows Terminal Server, Citrix does a superb job of publishing applications to a Linux desktop.  We currently have Citrix Metaframe 1.8 (Windows 2000 Server) and it is simply superb when published to a Linux desktop.  Hard to fault, it is nevertheless stupendously expensive - I recently calculated that, for us, it would treble the cost of the Windows Terminal Server and for that reason we are moving away from Citrix.

   * Install Citrix Presentation Server Client

### 2x

   * http://www.2x.com/

Similar to Citrix, but very much simpler to install.  I tested this and found it very simple to install and use.  Very much cheaper than Citrix, 2x will only marginally increase your Windows cost.

Unfortunately, at the time of my testing 2x, the features did not include the ability to set a client hostname (which was required to work with a particular Windows application) nor did it support client drive mapping.  In particular the latter meant that it was not easy to map the Windows "My Documents" folder to the users' Linux home directory.

I would hope that by now these features would be included, but at the time of writing I could not find out this information from their website.  You should make your own enquiries.

   * Install 2x client

### SeamlessRDP

   * http://www.rdesktop.org/
      * http://www.cendio.com/seamlessrdp/
         * http://www.fontis.com.au/rdesktop

This is the only open-source route to application publishing.  The good aspects are that it is fully featured - supporting client hostnames, client devices, sound, drive mapping and much else besides.  The negatives are that, sadly, there are some issues.  Using patched versions of rdesktop this is rather experimental.

That said it is the route we have currently taken and it is working.  The issues for us are: Microsoft Word cannot be run as the first application, or for some bizarre reason the File Open dialog opens behind the application window; one particular application cannot be restored when minimised with multiple windows open.


## Virtualise

If you are going to run a Windows server, then most Linux advocates would advise you to virtualise it.  We have gone one step further in running it in snapshot mode, so that at any time we can kill it and restart it back to the snapshot.  This has proved absolutely bulletproof - so far.

   * Windows Virtualisation
