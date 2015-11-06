## Install ImageMagick

<<<---
%TOC%
<<<---

### Quick Installation

<pre>
# apt-get build-dep imagemagick
# apt-get install imagemagick perlmagick html2ps lpr libwmf-bin
</pre>

See Testing below.

### Manual Installation

#### References

   * http://www.imagemagick.org/script/install-source.php#unix
      * http://www.imagemagick.org/script/advanced-unix-installation.php

#### Download

    * http://www.imagemagick.org/script/install-source.php#unix

#### Installing Image Libraries

<pre>
# apt-get install libjpeg62-dev libpng12-dev libtiff4-dev
</pre>

Alternatively the following should install everything needed by ImageMagick:

<pre>
# apt-get build-dep imagemagick
</pre>

I think its a good idea to remove the apt-get installed version of ImageMagick, if indeed it exists:

<pre>
# apt-get remove imagemagick
</pre>

Don't worry about Ghostscript, if gslib is unavailable it will fall back on the Ghostscript binary.

#### Installation

<pre>
$ gunzip -c ImageMagick-6.x.x.tar.gz | tar xvf -
$ cd ImageMagick-6.x.x
$ ./configure --without-x
$ make
$ make install
$ make clean
$ ldconfig /usr/local/lib
</pre>

<?> To make ldconfig remember this change permanently, simply add "/usr/local/lib" to "/etc/ld.so.conf"


### Testing

<pre>
$ cd..
$ convert -version
$ convert logo: logo.gif
</pre>

### Support

   * http://studio.imagemagick.org/mailman/listinfo/magick-users
      * http://www.nabble.com/Magick-users-f13962.html
   * http://studio.imagemagick.org/magick/viewforum.php?f=7

### Tips

PDF Thumbnails

<pre>
# convert "Trident Honda Fax Header.pdf[0]" -thumbnail "200x200" test.gif
</pre>
