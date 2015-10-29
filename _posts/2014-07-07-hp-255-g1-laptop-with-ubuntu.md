--- 
layout: post 
title: HP 255 G1 Laptop With Ubuntu
date: 2014-07-07
type: post 
published: true 
status: publish
categories: technology linux ubuntu
tags: hp laptop
---

At work I needed a cheap laptop for a computer-illiterate user. Giving
them Windows, would have meant that they would have had to
keep up-to-date with Windows Updates, with all the potential issues that
would cause, along with the need for malware protection. It would also
have pushed up the cost, a laptop capable of pushing Windows along
reasonably decently, would have cost a few hundred pounds at least.

<a href="http://www.ebuyer.com/620311-hp-255-g1-laptop-with-ubuntu-h6q17ea-abu"><img src="/assets/ubuntu-laptop-000.jpg" class="image-left" alt="HP 255 G1 Laptop with Ubuntu"></a>

Generally I would just have purchased a low-end Lenovo laptop and
installed [Ubuntu](http://ubuntu.com "Ubuntu") onto it, but I was aware
that Ebuyer had recently launched an 
[HP255 G1 Laptop with Ubuntu pre-installed](http://www.ebuyer.com/620311-hp-255-g1-laptop-with-ubuntu-h6q17ea-abu "HP 255 G1 Laptop with Ubuntu")
for £219.99 inc. vat (just £183 if you can reclaim the VAT).

Buying pre-installed with Ubuntu afforded me the comfort of knowing that
everything would work. Whilst Ubuntu generally does install very easily,
there are sometimes hassles in getting some of the function buttons
working, for brightness, volume etc. Knowing that these issues would all
be sorted, along with saving me the time in having to install Ubuntu,
seemed an attractive proposition.

Unboxing
--------

<img src="/assets/ubuntu-laptop-002-300.jpg" class="image-right" alt="Windows 8 Instructions">

My first impressions were good, the laptop comes with a laptop case and the
laptop itself looks smart enough for a budget machine. An Ubuntu sticker,
instead of the usual Windows sticker, was welcome, although the two sticky
marks where previous stickers had been removed were less so.  Still, at least
they **had** been removed.

Whilst we are on the subject of Windows' remnants - the Getting Started
leaflet was for Windows 8 rather than Ubuntu. Most Ubuntu users won't
care, but this is a poor attention to detail and, if this laptop is to
appeal to the mass market, then it may cause confusion.

First Boot
----------

Booting up the laptop for the first time gave me an "Essential First
Boot Set-up is being performed. Please wait." message. I did wait and
for quite a considerable time - probably a not dissimilar time to
installing Ubuntu from scratch; I couldn't help but suspect that was
precisely what was happening. Eventually I was presented with a EULA
from HP, which I had no choice but to accept or choose to re-install
from scratch. Finally I was presented with an Ubuntu introduction, which
I confess I skipped; suffice to say the new user was welcomed to Ubuntu
with spinny things.

The first thing to note is that this is Ubuntu 12.04, the previous LTS
(Long Term Support release). This will be supported until 2017, but it
is a shame that it didn't have the latest LTS release - Ubuntu 14.04.
Users may of course choose to upgrade.

<img src="/assets/ubuntu-laptop-003-300.jpg" class="image-left" alt="Ubuntu sticker">

Secondly, the wireless was slow to detect the wireless access points on the
network. Eventually I decided to restart network-manager, but just as I was
about to do so, it suddenly sprang into life and displayed all the local access
points. Once connected, it will re-connect quickly enough, but it does seem to
take a while to scan new networks. Or perhaps I am just too impatient.

Ubuntu then prompted to run some updates, but the updates failed, as
"91.189.88.153" was said to be unreachable, even though it was
ping-able. The address is owned by
[Canonical](http://www.canonical.com/ "Canonical - the Company behind Ubuntu"),
but whether this was a momentary server error, or some misconfiguration
on the laptop, I have no idea.

This would have been a major stumbling block for a new Ubuntu
user. Running apt-get update and apt-get dist-upgrade worked fine,
typing Ctrl+Alt+t to bring up the terminal and then typing:

    $ sudo apt-get update
    $ sudo apt-get dist-upgrade

I notice that this referenced an HP-specific repository doubtless
equipped with hardware specific packages:

    http://oem.archive.canonical.com/updates/ precise-oem.sp1 public
    http://hp.archive.canonical.com/updates precise-stella-anaheim public

I assume that adding this latter repository would be a good idea if
purchasing a Windows version of this laptop and installing Ubuntu.

Hardware
--------

This is a typical chunky laptop.  But, if you were expecting a sleek
Air-like laptop for £220, then you need to take a reality shower. What
it is, is a good-looking, well-made, traditional laptop from a quality
manufacturer. At this price, that really should be enough.

Ubuntu "System Details" reveals that this is running an "AMD E1-1500 APU
with Radeon HD Graphics x 2", running 64-bit with a 724GB drive and
3.5GiB RAM. That would appear to be a lower spec processor than is
typically available on-line for an HP 255 G1 running Windows; which
generally seem to have 1.75Ghz processors (albeit at twice the price).

The great news was that, as expected, all the buttons worked. So what?
Well, it may seem like a trivial matter whether, for example, pressing
Fn10 increases the volume or not, but I think many of us have the
experience of spending inordinate amounts of time trying to get such
things to work properly. And buttons that don't work, continue to
irritate until the day you say goodbye to that machine. The fact that
everything works as it should is enormously important and is the primary
reason why buying Ubuntu pre-installed is such a big deal.

The keyboard and trackpad seem perfectly good enough to me, certainly
much better than on my
[Novatech ultrabook](http://chrisjrob.com/tag/novatech/ "Posts about Novatech"); although
[not everyone seems to like
them](http://www.amazon.co.uk/HP-E1-1500-Processor-Integrated-Graphics/product-reviews/B00K2YUC2K/ref=dpx_acr_txt?showViewpoints=1 "Amazon reviews").
In particular, it is good to have a light on the caps lock key.

I have not tested battery life, but, as this is usually the first thing
to suffer in an entry-level machine, I would not hope for much beyond a
couple of hours.

For other details on hardware, please refer to [the product
information](http://www.ebuyer.com/620311-hp-255-g1-laptop-with-ubuntu-h6q17ea-abu "HP 255 G1 Laptop with Ubuntu") and
[read more reviews
here](http://www.reevoo.com/partner/EBU/620311 "HP 255 G1 Laptop with Ubuntu").

Performance
-----------

Booting up takes around 45 seconds and a further 20 seconds to reach the
desktop. That is quite a long time these days for Ubuntu, but fast
enough I would imagine for most users and considerably faster than it
takes Windows to reach a usable state, at least in my experience.

Being that bit slower to boot, Suspend becomes more important: Closing
the lid suspended the laptop and opening it again brought up the lock
screen password prompt almost immediately. Repeated use showed this to
work reliably.

As to system performance, well frankly this is not a fast laptop. Click
on Chromium, post boot, and it takes about 9 seconds to load;
LibreOffice takes about 6 seconds to load. Even loading System Settings
takes a second or two. Once you've run them once, after each boot, they
will load again in less than half the time. Despite the slow
performance, it is always perfectly usable, and is absolutely fine for
email and web-browsing applications.

The other thing to remember is that this will be the performance you
should be able to expect throughout its life - i.e. it will not slow
down even more as it gets older. Windows users typically expect their
computers to slow down over time, largely because of the different way
in which system and application settings are stored in Windows. Ubuntu
does not suffer from this problem, meaning that a 5-year-old Ubuntu
installation should be working as fast as it did when it was first
installed.

Conclusions
-----------

I struggle to think of what else you could buy that provides a full
desktop experience for £220. And it isn't even some cheap unbranded
laptop from the developing world. Sure, it isn't the fastest laptop
around, but it is perfectly fast enough for web, email and office
documents. And the fact that you can expect it to continue working, with
few, if any, worries about viruses, makes it ideal for many users. It
certainly deserves to be a success for HP, Ubuntu and Ebuyer.

But, whilst this low-price, low-power combination was ideal for me on
this occasion, it is a shame that there are no other choices available
pre-installed with Ubuntu. I wonder how many newcomers to Ubuntu will
come with the belief that Ubuntu is slow, when in reality it is the
low-end hardware that is to blame?

Please HP, Ubuntu and Ebuyer - give us more choice.

And Lenovo, please take note - you just lost a sale.

For more reviews please visit
[Reevo](http://www.reevoo.com/partner/EBU/620311 "HP 255 G1 with Ubuntu").

