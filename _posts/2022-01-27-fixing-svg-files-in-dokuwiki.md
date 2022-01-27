---
layout: post
title:  "Fixing SVG Files in DokuWiki"
date:   2022-01-27 10:00:00
category: technology 
tags: [linux, dokuwiki, nginx]
image: dokuwiki.gif
published: true
---

Having upgraded a DokuWiki server from 16.04 to 18.04, I found that SVG images were no longer displaying in the browser.
As I was unable to find any applicable answers on-line, I thought I should break my radio silence by detailing my solution.

<!--more-->

Inspecting the file using browser tools, Network and refreshing the page showed that the file was being downloaded as octet-stream.
Sure enough using curl showed the same.

    curl -Ik https://example.com/file.svg

All the advice on-line is to ensure that `/etc/nginx/mime-types` includes the line:

    image/svg+xml   svg svgz;

But that was already in place.

I decided to try uploading the SVG file again, in case the Inkscape format was causing breakage.  Yes, a long-shot indeed.

The upload was rejected by DokuWiki, as SVG was not in the list of allowed file extensions; so I added the following line to `/var/www/dokuwiki/conf/mime.local.conf`:

    svg   image/svg_xml

Whereon the images started working again.
Presumably Dokuwiki was seeing the mime-type as `image/svg` instead of `image/svg+xml` and this mismatch was preventing nginx serving up the correct content-type.

Hopefully this will help others, do let me know if it has helped you.

