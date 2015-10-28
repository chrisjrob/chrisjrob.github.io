--- 
layout: post 
title: Viewing A Textual PDF In Mutt
date: 2011-03-23
type: post 
published: true 
status: publish
categories: technology linux
tags: mutt pdf
---

I think there must be something wrong with me. Why, in this age of
graphical user interfaces, does it delight me so much that I can view
textual PDFs within Mutt (on a remote server without a gui)?

To set this up, you need to install pdftotext. This application is
available in either poppler-utils or xpdf-utils - most people seem to
use the latter, but I suspect the former is probably a better option for
a text-only server. I installed poppler-utils.

Next create (or edit) the `~/.mailcap` file, so that it has the
following line:

    application/pdf;                pdftotext -layout %s -; copiousoutput

You could also add the line:

    text/html;                      elinks %s; nametemplate=%s.html`

The latter line opens HTML attachments in elinks.

Then just hit "V" when viewing an email, and you will see the
attachments, select the attachment and hit Enter to view it. Awesome :)

