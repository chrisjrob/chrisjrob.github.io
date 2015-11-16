--- 
layout: post 
title: Banking With Barclays On Linux
date: 2011-02-25
type: post 
published: true 
status: publish
category: technology
tags: [linux, barclays, banking]
image: barclays.jpg
---

Further to [my recent post]({% post_url 2011-02-23-barclays-on-line-banking %} "Barclays on-line banking")
on the subject, I have now found [more information](http://www.business.barclays.co.uk/BRC1/jsp/brccontrol?task=homefreevi8&value=10335&target=_blank&site=bbb "Barclays Corporate Internet Security") on the Barclays Corporate website:

> To access Business Internet Banking you need four things present at
> the same time:

<!--more-->

> 1.  A PC or laptop with the software that runs the smart card reader
>     installed
> 2.  A smart card reader. This is a hardware device, attached to your
>     PC that the smart card is inserted into
> 3.  A smart card unique to each individual user. The card will become
>     “locked” if an invalid PIN is entered in excess of a pre defined
>     number of times
> 4.  A PIN unique to each individual user.

Unfortunately the [Software Requirements link](http://www.business.barclays.co.uk/BRC1/jsp/brccontrol?task=popup1vi8&value=13114&target=_blank&site=bbb "Barclays Software Requirements"),
at the bottom of that page, states only that you need Adobe Acrobat
Reader, which I suspect is not the only software requirement!

The Barclays Personal On-line banking works with all the browsers, so if
the same is true of the Corporate banking, then it is at least possible
that I could install Firefox under Wine on Linux, providing only that I
can get the smart card reader to work.

The difficulty would be if it needs Active-X support, which whilst
[theoretically supported under the latest versions of Wine](http://www.winehq.org/news/2010121001 "WineHQ Change Log"), would
make the proposition very much less likely to work.

