---
layout: post
title:  "Command line XML validator"
date:   2008-12-18 00:00:00
category: technology
tags: [linux, cli, xml]
---

I have always used the [W3Schools On-line XML validator](http://www.w3schools.com/XML/xml_validator.asp), but have always found it unreliable and I've never got it to validate against an XML schema file.

Thanks to Google I came across the following command (part of `libxml2-utils`):

<!--more-->

    $ xmllint --noout --schema schema.xsd file.xml

I find it amazing that all this time I had the perfect command pre-installed on my Linux desktop and I never knew.
