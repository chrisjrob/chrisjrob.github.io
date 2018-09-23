---
layout: post
title:  "Fixing Album Art in SONOS Under Linux"
date:   2018-09-23 13:00:00
category: technology 
tags: [linux, sonos, sound]
image: sonos-play-3.jpg
published: true
---

Following my purchase of a [SONOS system]({% post_url 2016-02-20-sonos-review %}), I wanted to be able to play my music collection through it.
Unfortunately many of the album covers were missing.
After considerable googling I eventually determined that the missing covers were missing because I had embedded the album cover with a higher resolution than SONOS can cope with. 

To fix this problem I needed to extract the embedded images, change the resolution, remove the current images, and re-embed the new lower resolution image.
I needed to do this for each album that is missing its cover.

<!--more-->

Adding your music library to SONOS
----------------------------------

Firstly, a word about adding my music library to SONOS. 
This involved transferring my MP3 music collection onto an external hard drive and plugging it into my router and sharing it as a Samba share.
The final step is to add Music Library as a service within the SONOS app, and specify the location of the Samba share created above.

If your router doesn't offer a Samba option, then you might consider a Raspberry Pi with a simple samba share, or using NextCloud or a dedicated plug-in device like the [Tonido Plug]({% post_url 2012-02-25-tonidoplug-tnd003sp1a03-65-tonido-store %}), or pretty much any NAS device.


Important Notice
----------------

Unfortunately, whilst I made some key notes at the time, a couple of years has passed before I finally found the time to type up this post.
As a result there may be some errors, or you might need need to interpret / adjust some of these commands.

I do not wish to be responsible for you losing your music collection, please do take a backup of your music before you start.

Please do let me know if you spot any mistakes, by commenting below.


Preparation
-----------

These instructions only require eyeD3 and either grapicsmagick or imagemagick.
These instructions were written for Ubuntu GNU Linux, you will need to adapt these instructions if you use a different distribution.

    $ sudo apt install eyed3 graphicsmagick

If you already have Imagemagick installed, then you may use that instead, just remove the "gm " from the relevant commands below.


Step 1: Extract image from music
--------------------------------

**Please change directory into the first album that requires fixing, and stay in that directory until you have finished all steps.**

As the album cover is embedded in each track in the album, you only need to extract this once per album:

    $ eyeD3 --write-images=./ "01 - Track 1 name.mp3"

This will extract the embedded image from the file as:

    FRONT_COVER.JPG


Step 2: Identify current resolution
-----------------------------------

The next step is to identify the size of the image, to do this I use graphicsmagick, but imagemagick will work the same (just omit the `gm`):

    $ gm identify FRONT_COVER.JPG

If the size of the image is already smaller than 300x300 pixels, then it *should* already be working, otherwise we need to reduce its size.


Step 3: Convert
---------------

To reduce the size of the image, do a simple convert:

    $ gm convert FRONT_COVER.JPG -geometry 300x300 folder.jpg

If you would like to check that this has worked just run:

    $ gm identify folder.jpg


Step 4: Remove images from MP3 files
------------------------------------

Before we can add the newly sized image, we need to remove all the embedded images in the tracks.

Please note that this command alters your music, please do take a backup to ensure that you can restore the tracks if necessary.

    $ eyeD3 --remove-images *.mp3


Step 5: Add new image to MP3 files
----------------------------------

And finally we can now embed the smaller image:

    $ eyeD3 --add-image=./folder.jpg:FRONT_COVER *.mp3


Step 6: Update music index
--------------------------

I cannot remember whether or not I needed to update the music index, but if your album covers haven't appeared already - try this:

 * Open the SONOS app
 * Settings
 * Manage Music Library
 * Update Music Index Now


Conclusion
----------

I was in two minds as to whether to post this, given the time elapsed, but hopefully it will prove useful to someone. 
Please do comment below if you spot any errors, or found it useful.

Thank you.
