--- 
layout: post 
title: Linux Is Free And Wastes Less Time Than Windows
date: 2012-11-26
type: post 
published: true 
status: publish
categories: technology
tags: 
---

It is commonly said, at least in Microsoft circles, that Linux is free
if you do not value your time. But is that really true, given the ease
of installing and updating software under Linux?

Today I needed to install a Windows-only budgeting program called
Profitplanner on our Windows 2003 server. This process was
straightforward enough, just a ZIP download which needed extracting and
installing.

Whilst the install worked fine, it warned that I needed to install the
Microsoft Visual J\# 2.0 Redistributable package, and gave me a link so
to do.

Unfortunately the Download button on the Microsoft website would not
work in Internet Explorer 8, forcing me to use Chrome instead.\
\
 Having downloaded the executable I then tried to install it, but no
good - it needed .NET installed first.

The link provided did not take me to the application download page, but
instead took me to the main Microsoft download page, where there were
1042 results for ".NET framework".

The instruction was to install .NET "2.0/3.0", which I take to mean
either 2.0 or 3.0. Even filtering for Windows Server 2003 R2 results in
78 results - 5 pages - including service packs, updates, patches, SDKs
etc. There seems to be know way of filtering the results further,
leaving me manually searching for Application entries.

I then realised that I should have checked that I don't already have it
installed already, even though it had told me that I hadn't. Sure enough
I did indeed already have .NET Framework 4 installed. Do I really need
to install 2.0 or 3.0 alongside it?

I decided to attempt a fresh installation of the .NET Framework 4, but
doing so merely told me what I already knew - that it was already
installed. The conclusion had to be that that I needed an older version
of .NET than that currently on my system, or perhaps a newer version of
Visual J\#? I searched for the latter first, but 2.0 does indeed appear
to be the newest version.

Going down the tack of installing an older version of .NET, a Google
search suggested that 3.5 might include versions 2.0 and 3.0. I would
have assumed that 4.0 is just a development of that, but who knows - at
this stage it is worth a try. I downloaded and attempted to install, but
then realised that I have inadvertently downloaded the web installer,
which just kept restarting, possibly our proxy server getting in the
way. I search again, this time for the redistributable package, and
downloaded that.

I then tried to install J\#, but again it insisted on 2.0 of the .NET
Framework.\
 Only then did I realise that I had installed the .NET Compact
Framework.

Yes this was completely my fault, but mistakes like this are inevitable
when using the Microsoft Download Centre, as you are offered a
bewildering array of similarly named downloads.

I uninstall the .NET Compact Framework, and search again, eventually
finding the 3.5 redistributable listed at the bottom of the .NET
Framework 3.5 web installer page. The 197mb download (there are Linux
distributions smaller than that) took a while to download and even
longer to install. Eventually it completed successfully.

Installing J\# now worked, so clearly 3.5 worked where 4.0 did not. With
J\# installed I was then able to easily install Profitplanner.

Success at last.

Having gone through the above craziness, it occurred to me that .NET is
a supported CrossOver Linux application, and J\# is probably easily
installed as well... 10 minutes later I had a CrossOver bottle with a
working copy of ProfitPlanner.

Perhaps unusually it was actually simpler to install a Windows
application under Linux than it was under Windows.

