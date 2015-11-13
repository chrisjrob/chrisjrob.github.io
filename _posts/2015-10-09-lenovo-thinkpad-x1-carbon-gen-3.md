--- 
layout: post
title: Lenovo ThinkPad X1 Carbon Gen 3
date: 2015-10-09 19:31:57.000000000 +01:00
type: post
published: true
status: publish
category: technology
tags: [linux, lenovo, thinkpad, ubuntu, review]
image: lenovo-laptop-thinkpad-x1-carbon-2-front-2_300.jpg
--- 

<a href="/assets/lenovo-laptop-thinkpad-x1-carbon-2-front-2.jpg"><img src="/assets/lenovo-laptop-thinkpad-x1-carbon-2-front-2_300.jpg" class="image-right" alt="Lenovo ThinkPad X1 Carbon Gen 3"></a>

Following the [demise of my Novatech
n1410]({% post_url 2015-10-01-novatech-n1410-ultrabook-32-months-on %}),
I have now taken delivery of a shiny (actually "shiny" is one thing it
isn't!) new [Lenovo ThinkPad X1 Carbon Gen
3](http://shop.lenovo.com/gb/en/laptops/thinkpad/x-series/x1-carbon/).
This is not a review of the X1 Carbon - [there are plenty of those
available already](http://lmgtfy.com/?q=review+x1+carbon+3rd+gen), but
merely my experience of the first few days of ownership.

So why did I choose the X1 Carbon?

<!--more-->

1.  Quality of construction and life expectancy;
2.  [Ubuntu hardware
    certification](http://www.ubuntu.com/certification/hardware/201411-16196/);
3.  Screen resolution 2560x1440 - perfect for remote support;
4.  Keyboard and Trackpad quality - two of my dissatisfactions with the
    Novatech;
5.  Weight: at 1.3kg - it is much lighter than the Novatech and much of
    the competition.

The high cost was a concern to me, but having paid £479 for the Novatech
and it having only lasted 32 months, I was very conscious that price
isn't everything. I bought the X1 Carbon from [BT Business
Direct](http://www.businessdirect.bt.com/products/lenovo-thinkpad-x1-carbon-intel-core-i5-5200u-8gb-256gb-ssd-14--windows-7-professional-64-bit-20bs006euk-B758.html)
for a touch under £1,000.

When it arrived I was very surprised by the size of the packaging - this
was a very small box for something so expensive! The one thing that I
was not expecting was to be excited by the looks of this laptop - the
words "business-like" best summed up my expectations. In the flesh I
found the X1 Carbon absolutely stunning - the photo above is one of the
few that I have found that do it justice.

By this point I was [as happy as a Frenchman who's invented
self-removing
trousers](http://www.bbc.co.uk/comedy/blackadder/episodes/three/three_ink.shtml).

Ubuntu Installation
-------------------

I downloaded Ubuntu 14.04-3 LTS
64-bit and copied it to my [iodd 2531 Black USB 3.0 External Hard Drive
Enclosure Virtual DVD Blu-ray
ROM](http://www.amazon.co.uk/gp/product/B00S65FARE/ref=as_li_tl?ie=UTF8&camp=1634&creative=19450&creativeASIN=B00S65FARE&linkCode=as2&tag=robsquadnet-21).
The Ubuntu installation was flawless and fast. I opted for a whole drive
encrypted LVM install and in no time was booting into Ubuntu. The screen
was absolutely beautiful - for the first time I had a laptop with a
screen to rival an Apple Macbook.

Display Issues
--------------

<img src="/assets/imag1412_300.jpg" class="image-right" alt="Screen corruption">

Ubuntu prompted me to run software update (I never update during the install
process), which I duly did. Having rebooted - disaster struck - the boot
process almost immediately dumped me to this screen. I was able to enter my
drive encryption password blind and it then progressed to the
beautiful LightDM login screen as before.

I [logged this as a bug with
Ubuntu](https://bugs.launchpad.net/ubuntu/+source/plymouth/+bug/1503716) and
then installed an [Ubuntu Mainline
kernel](http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19.8-ckt7-vivid/) and, whilst
it still exhibited the screen corruption, it included a new Drive
Encryption Password Prompt which did not suffer from the problem and
gave me a functioning system once again (but read on for more).

Trackpad Buttons
----------------

I then noticed that the trackpad buttons were not working. Well that's
not entirely true - they were scrolling up and down a page, rather than
behaving as normal trackpad buttons. This [Ubuntu
Question](http://askubuntu.com/questions/599477/lenovo-x1-carbon-2015-3rd-gen-20-bs-trackpoint-clickpad-and-wifi)
suggested that I was not alone and offered a solution - that of changing
the trackpad from synaptic to imps driver. I tried this, but instantly
the Trackpad felt less responsive, the cursor slowed down and whatever I
tried to customise it made no odds.

But more importantly the Trackpad buttons still didn't work.

It is worth noting that even without the Trackpad buttons, you can still
left-click (single finger tap to Trackpad) and right-click (two finger
tap to Trackpad). In reality this is what I shall use in day-to-day
operation, so this is issue is not a show stopper - at least for me.

After much head scratching and trial and error I found that by rebooting
into the original 3.19.0-25 kernel, holding the Shift key down to access
Grub during boot process, not only fixed the Trackpad issue, but it also
resolved the screen corruption issues during the boot process.

As a result, I decided to uninstall the newer Kernel 3.19.0-30, which
contains the problem, along with the mainline kernel and generic LTS
kernel packages. This will prevent any further updates to the
Kernel and is clearly only a short-term fix, but the benefit is a
perfectly working system.

Review of Reported Ubuntu X1 Carbon Gen 3 Issues
------------------------------------------------

It is possibly worth reviewing that [Ubuntu
Question](http://askubuntu.com/questions/599477/lenovo-x1-carbon-2015-3rd-gen-20-bs-trackpoint-clickpad-and-wifi)
again and the issues raised therein:

 1. Wi-Fi is disconnecting: I have not encountered this problem at all.
 2. Click-buttons are not working at all: Resolved by returning to kernel
    3.19.0-25.
 3. Vertical Scrolling (with trackpoint and middle button): Not tested
    as yet.
 4. Special Keys (like Brightness): these all work fine for me.
 5. Screen Characters scrambled on 14.10: not experienced in 14.04 as
    yet.
 6. Trackpoint Sensitivity: I think that was a by-product of the imps
    driver - which I have not needed to use.

In short, at least for the 3.19.0-25 kernel, this is a fully functioning
Ubuntu laptop!

Fingerprint Recognition
-----------------------

I was expecting problems with Fingerprint recognition, but that was not
the case. I simply installed a couple of packages, scanned my
fingerprints and it all worked fine.

    $ sudo apt-get install fprintd fingerprint-gui

There were two surprises: The first was that the fingerprint reader
works for command line use - so no more typing the sudo password -
simply swipe your finger! The second surprise was that it doesn't appear
to work for the initial LightDM login. The fingerprint scanner flashes a
couple of times and then stops. Given that you only type this once in a
session, this isn't a huge deal, compared to the number of times you
enter passwords for sudo and the lock screen.

There are [reports of LightDM not working with encrypted home
directories](https://bugs.launchpad.net/ubuntu/+source/libfprint/+bug/998367),
but I am using whole Drive Encryption which I wouldn't have thought
would have been affected in this way, given that I have already entered
my drive encryption password by this point.

If I manage to solve this problem I will of course update this page. If
you have any solutions please do comment below.

WLAN - 4G Wireless
------------------

Lastly, an oddity of the BT Business Direct specification is that this
laptop has a 4G WLAN slot. This was not something I particularly wanted,
but of course now that I have it I have had to order a £6.25 per month
Vodafone 4G Data Plan. Once the SIM card arrives I will provide
feedback.

Conclusion
----------

It is easy to be critical of some of the pitfalls in running Ubuntu on
the X1 Carbon, but the reality, with a few caveats, is that it works
flawlessly. The laptop is a joy to use, the keyboard feels wonderful and
running your fingers across the trackpad is an almost sensuous
experience - I may be getting carried away here, but suffice to say that
this is a very good laptop and it is working beautifully on Ubuntu with
the kernel 3.19.0-25.

With luck the bugs will be resolved and I will be able to update the
kernel in due course!

