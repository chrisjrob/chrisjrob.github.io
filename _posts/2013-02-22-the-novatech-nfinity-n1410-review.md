--- 
layout: post 
title: The Novatech Nfinity N1410 Review
date: 2013-02-22
type: post 
published: true 
status: publish
category: technology
tags: [novatech, laptop, review]
---

<img src="/assets/nfinityn1411.png" class="image-right" alt="nFinity n1410">

After spending much time trying to choose the perfect Ultrabook, I came to the
conclusion that it is either not made, or is prohibitively expensive. In the
meantime I ordered a [Novatech nFinity
n1410](http://www.novatech.co.uk/laptop/range/novatechnfinityn1410.html
"Novatech nFinity n1410") (14" Intel Core i5 3317 Mobile Processor - 8GB DDR3
Memory) for just £450 (plus VAT).

<!--more-->

My expectations were fairly low, given the price, but I expected
something that would be adequate and I was pleased to be able to buy a
laptop without a Microsoft operating system pre-installed.

Purchase and delivery were quick and painless, thanks to Novatech.

My first impressions were very agreeable, it looked much better than
expected with a metal top. The dimensions were just as I had expected -
it would fit in my briefcase and be light and portable, but still have a
decent sized screen.

Then I went to switch the n1410 on, oh dear, the power switch is
terrible! Cheap, nasty, with a horrible unsatisfactory movement. It
still irritates me every time I use it. It glows blue when powered and
red with disk activity. Once I went to put the laptop in my briefcase
and the flashing blue button reminded me that it was still in standby -
so yes the button is clearly functional - but still I hate it.

Installing [Ubuntu](http://ubuntu.com "Ubuntu") 12.10 was very simple,
with no issues whatsoever. With Ubuntu installed and working well, it
was time to reboot. I made the mistake of glancing away from the screen
for few seconds, and it was already sitting at the login prompt. It
boots in less than 15s, it takes longer to shutdown, but this is a great
benefit for a portable laptop.

Logging in and things just got better - the buttons all work, including
the FN buttons like brightness and media playback. This is seriously
impressive and the Ubuntu community deserve congratulations, as this is
no mean feat. Given how painless the installation is, you can't but
wonder why Novatech don't offer Ubuntu as an option.

This all seemed to good to be true, and it was, suddenly the wireless
signal dropped out, despite my sitting less than a metre away from the
wireless access point. And this kept happening. Googling for an answer I
ended up adding the following line to the end of
`/etc/modprobe.d/iwlwifi.conf`:

    options iwlwifi 11n_disable=1 bt_coex_active=N

This seemed to make the laptop usable, but it is not a long-term
solution. I was advised to try a newer kernel, and I am now on 3.6.3,
but it seems no different. The problem seems to be a bug with the
iwlwifi module,  and [it does seem to be known
about](https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1034740 "Bug 1034740"),
so hopefully a fix will wander down to Ubuntu soon. Maybe upgrading to
13.04 will fix all, but that is one for another day.

I tried closing the laptop, whilst still on, and it promptly went into
standby mode. I opened the lid again and the laptop sprung back into
life, although the wireless was not connected. Restarting
network-manager revived the wireless connection. I can live with that.
In fact I do find that I frequently need to restart network manager when
first powering up, which may well be more evidence of the flaws in
iwlwifi.

The screen is glossy, which is never a good thing, but other than that I
cannot fault it. The speakers are a little tinny, but I suspect that
that is par for the course with an Ultrabook. The keyboard feels a bit
cheap and I keep missing letters, or getting letters twice. I hope I get
used to this, but it has to be said that the keyboard is not a pleasure
to use.

I am also struggling with the trackpad. My previous laptops have had
smaller trackpads, which I would occasionally catch when typing. This
laptop has a large trackpad, which I am constantly catching, and it is
driving me slightly mad. I am not sure that this is the fault of
Novatech though, in theory Ubuntu should disable the trackpad when
typing, but in my experience it could work better. Maybe I can improve
this is some way and I will do further research.

Another trackpad irritation is that the right hand side of the pad seems
to be the right-mouse-click, and the left hand side - the left mouse
click. Whilst flawlessly logical, it means that right handed users have
to travel a long way for left click. I suspect that this is a trait of
new Xorg versions, but I have done no research on the matter. Maybe I
will get used to it.

The trackpad does have buttons below it, but they are simply horrible to
use, requiring a considerable pressure to work, for that reason I tend
to only use the trackpad itself.

Sticking with the default 128gb SSD was a mistake though, as I could not
even transfer my Pictures folder (blame my young family and camera
touting wife!). I knew that [popey](http://popey.com/ "Popey") had added
an mSATA drive to his Lenovo X220, and I telephoned Novatech to find out
if this would be possible with the n1410. The answer was that yes it had
an mSATA port, but that it was limited to 32gb and would only be used to
improve the boot speed. I was not convinced that they were correct and
Googling the subject showed that Dell had said the same about their
laptops, and it was not true. With some concern I ordered a [Crucial
CT256M4SSD3 256GB m4 mSATA 6Gb/s Internal
SSD](//www.amazon.co.uk/gp/product/B0085J17UA/ref=as_li_ss_tl?ie=UTF8&camp=1634&creative=19450&creativeASIN=B0085J17UA&linkCode=as2&tag=robsquadnet-21).
To cut a long story short- this proved successful and I intend writing
up the experience [in a separate
post](http://chrisjrob.com/2013/03/22/fitting-msata-drive-to-the-novatech-nfinity-n1410/ "Fitting mSATA Drive to the Novatech nFinity n1410").

Battery life seems excellent - with past laptops I have generally used
them connected to the mains, but the battery life on the n1410 is good
enough that I am finding myself using it more like a tablet, in leaving
it on most of the time. I believe 5 hours should be possible.

Overall this is a very good value Ultrabook. Clearly it is not perfect,
but I never expected it to be, I expected it to be adequate and
functional, and that it certainly is. That it is also attractive, with a
reasonable screen, battery life and all working with Ubuntu is just
fantastic. All in all I am very pleased with my new Ultrabook.

