---
layout: post
title:  "Command line PDF tool pdftk"
date:   2008-12-09 00:00:00
categories: technology linux cli
tags: pdftk
---

I had a 25-page OpenOffice writer document that needed to be sent to as a pdf.  Obviously creating a pdf from OpenOffice is simple enough, but I wanted to insert within the final pdf additional pages from other documents (i.e. not just simply appended on the end).

We often use pdftk for command line pdf, but I hadn't delved deeply into the features.  But using pdftk all I had to do was:

    $ pdftk A=main.pdf B=2nd.pdf C=3rd.pdf cat A1-24 B A25 C output final.pdf

In other words the final document (final.pdf) is pages 1-24 of document A (main.pdf), the whole of document B (2nd.pdf), page 25 of document A (main.pdf) and the whole of document C (3rd.pdf).

For a command line program, I think that is stunningly intuitive.  And best of all it was instantaneous and there was no loss of quality.

pdftk can seemingly do just about anything with pdfs, including encrypt, decrypt, repair, burst and rotate.

pdftk is installable from the Debian repos and typing `pdftk --help` gives you a handy set of usage examples, so that you don't have to re-learn it every time you use it.
