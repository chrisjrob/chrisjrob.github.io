Fixing Album Art in SONOS Under Linux
=====================================

Step 1: Extract image from Music
--------------------------------

    $ eyeD3 --write-images=./ "01 - Track 1 name.mp3"

This will generally extract the embedded image from the file as:

    FRONT_COVER.JPG

Step 2: Identify current resolution
-----------------------------------

    $ identify FRONT_COVER.JPG

Step 3: Convert
---------------

    $ convert FRONT_COVER.JPG -geometry 300x300 folder.jpg

Step 4: Remove images from MP3 files
------------------------------------

    $ eyeD3 --remove-images *.mp3

Step 5: Add new image to MP3 files
----------------------------------

    $ eyeD3 --add-image=./folder.jpg:FRONT_COVER *.mp3


