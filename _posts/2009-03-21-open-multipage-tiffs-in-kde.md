---
layout: post
title: Howto | Open Multipage TIFFs in KDE
menu: howto
date: 2009-03-21 06:19:53
weight: 40
category: technology
tags: [howto, linux, tiff]
---

## The Issue

Most image viewers only show the first page of a multi-page `TIFF`.  The KDE document viewers, of which there are many (KView, KFax, KDVI) will not open them, stating "This version can only handle fax files".

## The Explanation

Wikipedia states that: -"Programmers were free to specify new tags and options, but not all implemented programs supported all created tags. As a result, TIFF soon became the lowest common denominator. Today, the majority of TIFF images and readers are still based on uncompressed 32-bit CMYK or 24-bit RGB images."~

The end result is that the KDE document viewers except a CCITT Group 4 compressed monochrome document, whilst ImageMagick creates a JPEG compressed document.

## The Solution

Currently my solution is simply to convert the document as required (you will need ImageMagick on your system):

    $ convert source.tif -monochrome -compress group4 destination.tif

## Further Thoughts

This fix is fine for geeks, but not much use for mere mortals.  My thought is to create a script which uses ImageMagick to interrogate the TIFF file, convert it, if required, into a temporary location, and then open it in one of the KDE document viewers.  Then associate the file-type with that script.

## References

   * http://www.imagemagick.org/Usage/formats/#tiff

