---
layout: post
title: Howto &#124; Install ImageMagick
menu: howto
date: 2009-03-21 06:02:20
weight: 40
category: technology
tags: [howto, linux, imagemagick]
---

## Quick Installation

    # apt-get build-dep imagemagick
    # apt-get install imagemagick perlmagick html2ps lpr libwmf-bin

See [Testing](#testing) below.

<!--more-->

## Manual Installation

### References

   * http://www.imagemagick.org/script/install-source.php#unix
      * http://www.imagemagick.org/script/advanced-unix-installation.php

### Download

   * http://www.imagemagick.org/script/install-source.php#unix

### Installing Image Libraries

    # apt-get install libjpeg62-dev libpng12-dev libtiff4-dev

Alternatively the following should install everything needed by ImageMagick:

    # apt-get build-dep imagemagick

I think its a good idea to remove the apt-get installed version of ImageMagick, if indeed it exists:

    # apt-get remove imagemagick

Don't worry about Ghostscript, if gslib is unavailable it will fall back on the Ghostscript binary.

### Installation

    $ gunzip -c ImageMagick-6.x.x.tar.gz | tar xvf -
    $ cd ImageMagick-6.x.x
    $ ./configure --without-x
    $ make
    $ make install
    $ make clean
    $ ldconfig /usr/local/lib

**To make ldconfig remember this change permanently, simply add `/usr/local/lib` to `/etc/ld.so.conf`**

## Testing

    $ cd..
    $ convert -version
    $ convert logo: logo.gif

## Support

   * http://studio.imagemagick.org/mailman/listinfo/magick-users
      * http://www.nabble.com/Magick-users-f13962.html
   * http://studio.imagemagick.org/magick/viewforum.php?f=7

## Tips

PDF Thumbnails:

    # convert "Trident Honda Fax Header.pdf[0]" -thumbnail "200x200" test.gif

