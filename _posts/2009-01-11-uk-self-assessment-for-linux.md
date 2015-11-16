---
layout: post
title:  "UK Self-Assessment for Linux"
date:   2009-01-11 00:00:00
category: technology
tags: [linux, tax]
image: hmrc.jpg
---

This morning I have been trying to find a way to complete my UK Self-Assessment Tax Return under Linux.  Unfortunately only one application appears to exist for Linux, called FTax, and this application requires Adobe Reader, which is not available for 64-bit Linux.  If you're comfortable on how to run 32-bit applications under Linux, then this might not be an obstacle for you.  After going all round the houses, I ended up back on Windows XP.

<!--more-->

## Submit a UK Self-Assessment Return under Linux

### Introduction

I created this page when completing my tax return for 2007/8, and am now updating it for 2008/09 tax year (January 2010).  I currently use TaxCalc running on Linux under my Windows virtual machine (in VirtualBox OSE), I would like to stop relying on Windows; so what are the options for submitting a UK Self-assessment tax return under Linux?

   * [Linux alternatives](#linux-alternatives)
   * [HMRC On-line Self-Assessment](#hmrc-on-line-self-assessment)
   * [Install TaxCalc under Wine](#install-taxcalc-under-wine)
   * [Run TaxCalc in VirtualBox](#run-taxcalc-in-virtualbox)

### Linux Alternatives

The following is [HMRC's list of approved software](http://www.hmrc.gov.uk/efiling/SA_efiling/soft_dev.htm) as at January 2010 is as follows:

   * [Acorah Software Products Ltd (TaxCalc)](http://www.taxcalc.com/) - Windows only
   * [Andica Limited](http://www.andica.com/) - Windows only
   * [BTC Software Limited](http://www.btcsoftware.co.uk/) - Professional only
   * [CCH Software](http://www.prosystem.cch.co.uk/) - Professional only
   * [Drummohr Technology Ltd](http://www.drummohr.com/) - Professional only
   * [Forbes Computer Systems Ltd](http://www.tax.co.uk/) - Windows only
   * [IRIS Software Ltd](http://www.iris.co.uk/) - Professional only
   * [Isokon Limited](http://www.isokon.com/) - Professional only
   * [Keytime Objective Ltd](http://www.keytimesystems.co.uk/) - Not available for download
   * [Legatio Ltd (Ftax)](http://www.ftax.co.uk/) - Windows, Mac and Linux
   * [PTP Software Ltd](http://www.ptpgroup.co.uk/) - Professional only
   * [Quality Management Software Ltd](http://www.sa2000.co.uk/) - Windows only
   * [RFA Limited](http://www.pinacleaccounts.co.uk/) - Professional only
   * [Sage (UK) Ltd](http://www.sage.co.uk/accountants/welcome.aspx) - Professional only
   * [Thomson Reuters](http://www.digita.com/) - Not seemingly available for download

N.B. The comments are my own personal impression at the time of visiting the websites, these opinions may be wrong and you should make your own enquiries before making a decision.

Some of these, like Sage, are clearly not consumer level products, and my impression is that the above list is somewhat misleading, as in practice TaxCalc seems to have the personal market pretty much sewn up.

#### FTax 

Of those that are consumer level products only ftax seems to support Linux.  Ftax requires Adobe Acrobat Reader, which is not currently available for 64-bit Linux, also the demonstration shows that it is a smart walk-through of the actuals forms; which does fall short of the wizard mode under TaxCalc.  So to run ftax I am only swapping one set of compatibility issues for another.  If you are running 32-bit Linux, then I would definitely investigate ftax further, perhaps by searching reviews of ftax.

If you are going to try ftax, then you will notice the lack of any help for Linux on their site.  In fact there is help, but it is difficult to find, given their lack of a search facility.  Google to the rescue:

   * [google "site:ftax.co.uk linux"](http://www.google.co.uk/search?hl=en&source=hp&q=site:ftax.co.uk+linux)

###  HMRC On-line Self-Assessment

Another option is to use HMRC's own software, which I believe is web-based.  The only issue with this is that it appears that you need to enrol in the on-line service, even if you have previously used TaxCalc (or other Internet-filing service); see the following page for details:

   * [HMRC Using Online](http://www.hmrc.gov.uk/sa/using-online.htm)

Nevertheless, this is probably a good option, judging from the on-line demo:

   * [HMRC Self Assessment Demo](http://www.hmrc.gov.uk/demo/individual/self-assessment/)

However, the system requirements for this service state:

*"If you use HMRC's tax software and; or the Data Provisioning Service, you will also need a minimum browser level, Internet Explorer 5.0 (Windows users) Safari 2.0.4 (Mac users) or Opera 7.0 (Windows or Mac) Your Internet browser must have JavaScript and cookies enabled and be capable of supporting 128-bit SSL. Other operating systems and browsers, such as Mozilla Firefox, may allow you to access the site and use the pages but might not display the site as designed or allow you to access all the functionality."*

Okay, so it doesn't mention Linux, but I wouldn't be unduly concerned about that.  No the issue seems to be the browser, and, reading between the lines, this would suggest to me that the site is using extensive Javascript, which is largely blocked (quite rightly) by Firefox.  The chances are that there would be issues; although it wouldn't be massive problem for me to fallback on IE under a Virtual Machine, your mileage may vary.

### Install TaxCalc under Wine

TaxCalc themselves state:

*"We do have some customers that run Windows emulation software to enable the use of Taxcalc on other Operating Systems (e.g. MAC OS). Although we have had some positive feedback on this we do not officially support the use of TaxCalc on Non-Windows Operating Systems at this time."*

So the next option is to consider installing TaxCalc under Wine, my concern with this is that I would expect that a simple application like TaxCalc would indeed install fine under Wine.  My concern would be that I would complete my tax return and go to upload to the tax office, and that point hit a snag.  Also, I am running on Debian Lenny 64-bit, surely that must effect Wine as well - can 64-bit Wine run 32-bit Windows applications?  The existence of [this page](http://wiki.winehq.org/WineOn64bit) would suggest that there may be issues.

Having downloaded TaxCalc, I opened the installation program in Wine.  The installation was successful, and the first run prompted for me to either enter the registration key, or connect to the Internet to find the registration key.  I decided to do the latter, in order to test connectivity, and it worked fine.  Then it crashed and I was unable to get back into TaxCalc again.

#### Update for 2010

A quick search on the [WineHQ AppDB](http://appdb.winehq.org) showed that someone has successfully installed TaxCalc under Wine; however he has not tested the online submission, which is crucial for me.  Given that he has used winetricks to install IE6 under Wine, then there is a good chance that it will work.  If you try it, do update the [WineHQ AppDB](http://appdb.winehq.org).

   * [TaxCalc 2009 under Wine](http://appdb.winehq.org/objectManager.php?sClass=version&iId=18299&iTestingId=46244)

### Run TaxCalc in VirtualBox

It is outside of the scope of this document to describe this in detail, suffice to say it works flawlessly.  The downside is that you are effectively running under Windows, which can hardly be considered a success.

### Conclusion

So what have I decided?  Well this year I will again continue with TaxCalc, installed on Windows XP running through VirtualBox.  Yes I could give ftax a go, but I am fairly unimpressed with their website, and lack of any obvious Linux help.  Also Googling for information on ftax and linux leads you back to this page - and, if this page really is the best help available for ftax and linux, then you're in real trouble.

So the best hope for Linux users is HMRC's own on-line service.  It is web-based and free, and whilst it does not promise Firefox support, I suspect that may not be an issue.  If you would like to be able to use TaxCalc natively under Linux, then why not let them know: by emailing them at sales@taxcalc.com.

