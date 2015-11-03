--- 
layout: post 
title: XKCD Wallpaper
date: 2011-03-21
type: post 
published: true 
status: publish
category: technology linux
tags: wallpaper xkcd
---

<a href="/assets/xkcd-wallpaper.png"><img src="/assets/xkcd-wallpaper_300.png" class="image-right" alt="XKCD Wallpaper"></a>

I confess, I like [XKCD](http://xkcd.com/). Even though some of them are
[unfunny](http://xkcd.com/871/) and others [beyond my understanding](http://xkcd.com/849/), 
sometimes, just sometimes, they 
[strike a chord](http://xkcd.com/208/).

<!--more-->

Once I [moved to pekwm](/tag/pekwm) I found myself with a black plain
desktop, what could be better, I thought, than the current XKCD comic in
the centre, with the tooltip comment located underneath in an
appropriate font.

![XKCD Wallpaper Screenshot](/assets/xkcd-wallpaper.png)
After some trial and error, I ended up writing 
[this script](http://pastebin.com/vqtmyRWW). 
It is far from perfect, and will
probably end up being broken at some point, although it survived 
[its first trial](http://xkcd.com/859/) unscathed. I'm a little embarrassed
by my tortuous curl/perl one-liner, ideally I would re-write this whole
thing in perl, but it has worked reliably for a couple of months, so I
dare say that I will never get around to it.

Currently it works for pekwm, and I dare say it will work for other
lightweight window managers, like openbox, that can use `feh` to set the
desktop wallpaper. If not, then it shouldn't be too difficult to modify
the script for your window manager or desktop environment. You can also
run the script without the `-w` switch in order to just create the XKCD
image in the directory for your own purposes.

You will obviously need `perl, curl, wget, and fold`, if they aren't
already installed on your system. Create a directory, say `~/.xkcd` and
save this script in there, along with the 
[XKCD font](http://antiyawn.com/uploads/Humor-Sans.ttf), mark the script as
executable. If you read the script, it is fairly self-explanatory I
think.

You basically run it like this:

    /path/to/.xkcd/xkcd -w -d '/path/to/.xkcd'

For pekwm, just add a line at the end of the `~/.pekwm/start` file:

    (sleep 30 && /path/to/.xkcd/xkcd -w -d '/path/to/.xkcd') &

I hope it works for you, feel free to comment any suggestions or
criticisms. If you do start using it, it would be fantastic if you could
add a comment to let me know.

