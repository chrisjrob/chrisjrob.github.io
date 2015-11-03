--- 
layout: post 
title: How To Scan to OCR From The Command Line
date: 2011-10-24
type: post 
published: true 
status: publish
category: technology linux
tags: cli ocr scan tesseract
---

I just had to remind myself how to scan to OCR, and thought I would
share the results.

Before you start, you need to have sane installed, and you also need
tesseract-ocr - both should be available in your distros repositories.

<!--more-->

    $ sudo apt-get install sane-utils tesseract-ocr

Next you need to find out what scanners you have available, and you do
this with:

    $ scanimage -L
    device `v4l:/dev/video0' is a Noname Vimicro USB Camera (Altair) virtual device
    device `plustek:libusb:004:002' is a Epson Perfection 1250/Photo flatbed scanner)

Obviously the latter is my scanner.

Assuming you have a working scanner, the following is a simple two liner
to scan and OCR.

    $ scanimage -d 'plustek:libusb:004:002' --mode Lineart \
    --format tiff -x 215 -y 297 --resolution 200 > example.tif

And finally convert to text with tesseract:

    $ tesseract /tmp/example.tif example

You should now have a file example.txt in your current directory, which
you can open in any text editor.

Obviously this has limitations - it works for single-page A4 portrait
typed documents - but it gives you the basics.

You could probably experiment with the resolution, 200 worked for me,
so I didn't bother trying anything else.  Traditionally the higher the 
resolution the better, but I seem to recall that tesseract works better
on 300 and below.

On my Epson Perfection 1250 I found that I needed to add the sane 
switch `--warmup-time 0` as otherwise it never finished warming up.

If you would prefer to OCR an existing PDF, which is another thing that
I find myself doing from time to time, then first convert it to a tif:

    $ convert -density 200 example.pdf -depth 8 /tmp/example.tif

And then run the above tesseract command.

