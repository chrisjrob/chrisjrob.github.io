--- 
layout: post 
title: Taxcalc Self Assessment Under Linux
date: 2015-12-30 11:6:30
type: post 
category: technology
tags: [linux, tax, taxcalc]
image: hmrc.jpg
published: true
---

I first wrote about the difficulties of submitting a UK self-assessment tax return [back in January 2009][2009post], with a [follow up in January of 2010][2010post]. 
In the subsequent years I have submitted my tax return under Windows with nary a thought about attempting it under Linux.

This year was different, I went to download [TaxCalc] as usual, only this time [there was a Linux option][taxcalc-linux]. 
I barely noticed at first, downloading the Windows version before I thought "Hang on, did that say Linux?".
It had indeed.

<!--more-->

Despite the fact that I do have a Windows PC now, as well as a Linux PC and a [Linux laptop][thinkpad], it probably makes more sense to perform my tax return on Windows now, but having posted on [this subject][tax] before I really ought to give it a go!

<img src="/assets/taxcalc-01.png" class="align-right" alt="Warning flag download as executable">
I won't detail all the installation instructions, which are [clearly described on the TaxCalc website][taxcalc-linux].

## Installation

Unfortunately the download is for a compiled ".run" file and not a distribution package, so you will have to decide whether you trust TaxCalc enough to run the file on your computer and potential dump unknown rubbish all over your system which might then be difficult to remove. 

I decided to give it a go, downloading the ".run" file and marking it as executable.
The instructions provided did not suggest running with sudo or as root, so I decided to follow the letter of the instructions and simply executed the .run file. 

This entered a typical Wizard style installer, which resulted in the application being installed within my home directory, including a 127MB "lib" directory containing a large number of Linux libraries.
This is very much the "Windows" way of doing things, bundling everything you need within the installation, rather than simply specifying dependencies.
But the fact is that it works and gives TaxCalc control over the installation, in a repeatable and supportable way. 

## Import from previous year

The first step in using TaxCalc is always to import the previous year's files. 
This process completed for all files without error.

<img src="/assets/taxcalc-02.png" alt="Example screen">

## Step by Step Process

The main reason for using TaxCalc is the simple step process through completing your tax return, and I am pleased to report that this aspect was identical to Windows. 


[2009post]: {% post_url 2009-01-11-uk-self-assessment-for-linux %}
[2010post]: {% post_url 2010-01-15-submit-a-self-assessment-tax-return-under-linux %}
[taxcalc]: http://www.taxcalc.com/
[taxcalc-linux]: http://www.taxcalc.com/kb/2471
[thinkpad]: {% post_url 2015-10-09-lenovo-thinkpad-x1-carbon-gen-3 %}
[tax]: /tag/ubuntu
