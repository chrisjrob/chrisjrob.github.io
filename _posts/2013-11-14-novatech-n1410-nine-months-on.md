--- 
layout: post 
title: Novatech N1410 Nine Months On
date: 2013-11-14
type: post 
published: true 
status: publish
category: technology
tags: [novatech, laptop, review]
image: nfinityn1411.png
---

The power switch remains a momentary petty irritation, but the poor
quality keyboard and intrusive trackpad are harder to live with. The
wireless is pretty poor, but it generally connects fine and rarely
actually causes me any problems.

But the [Novatech n1410] remains a good-looking, lightweight laptop with a
great battery life, and highly portable. And it was undeniably great value.

<!--more-->

One new irritation, that I hadn't noticed in my earlier review, is that
the volume can be too quiet in some circumstances. If sound is important
to you, and particularly if you require it to deliver the goods in noisy
environments, then you will probably need to invest in some external
speakers, for example a pair of [XMI X-Mini MAX V1-1 Capsule
Speakers](http://www.amazon.co.uk/gp/product/B004LLI0CY/ref=as_li_ss_tl?ie=UTF8&camp=1634&creative=19450&creativeASIN=B004LLI0CY&linkCode=as2&tag=robsquadnet-21" "XMI X-Mini Capsule Speakers").

Nine months on, and I decided to upgrade
[Ubuntu](http://www.ubuntu.com "Ubuntu") 12.10 to 13.04 and 13.10. The
upgrades both went flawlessly and as usual I do wonder why Ubuntu users
seem so tied to re-installing instead of upgrading.

But unfortunately it hasn't been all good news - the upgrade to 13.04
saw the introduction of two bugs:

**Brightness on Boot:** On booting up, brightness is set to the maximum
every time. The numerous suggested fixes didn't seem to work and so,
pending a better solution, I have installed "xbacklight" and added it to
the start-up applications with the switches "-set 20" to set it to 20%
brightness. And yes, I am aware that I could have just echoed the chosen
brightness to the relevant device file:

    # echo 1102 > /sys/class/backlight/intel_backlight/brightness

**Volume FN Buttons:** The volume buttons no longer work correctly, on
the first press the volume shoots up to maximum or minimum and then the
indicator keeps flashing, locking the keyboard and requiring a
[REISUB](http://www.wikipedia.org/wiki/reisub "REISUB") reboot. For the
time being I have simply re-mapped the F10, F11 and F12 buttons to do
the tasks that would normally be done by FN F10, FN F11 and FN F12 (see
screenshot).

[![Image]({{%20site.baseurl%20}}/assets/keyboard.png?w=650)](http://chrisjrob.files.wordpress.com/2013/11/keyboard.png)

But I cannot fairly blame Novatech for these bugs, what I need to do is
report bugs for them with Ubuntu. I have found an article about
[Backlight
Debugging](https://wiki.ubuntu.com/Kernel/Debugging/Backlight "Backlight Debugging") and
another on [Hotkey
Debugging](https://wiki.ubuntu.com/Hotkeys/Troubleshooting "Hotkeys Debugging"),
both of which I will be following at some point.


[Novatech n1410]: http://www.novatech.co.uk/laptop/range/novatechnfinityn1410.html
