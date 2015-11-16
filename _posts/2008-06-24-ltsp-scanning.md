---
layout: post
title:  "LTSP | Scanning"
date:   2008-06-24 00:00:00
category: technology 
tags: [scan, linux, ltsp]
image: ltsp_logo.png
---

Since upgrading to LTSP5, our scanning has ceased to work.  I have created a Work in Progress page called [LTSP5 Scanning]({% post_url 2009-11-18-ltsp5-scanning %}).  Having worked through the instructions contained on that page, scanning is still not working.  The logs show that the request `scanimage -L` is being detected by the client and the client is confirming that the LTSP server has permission, but it is then failing with:

<!--more-->

    Jun 24 12:16:55 juno scanimage: unable to open /var/run/hplip/hpssd.port: No such file or directory: prnt/hpijs/hplip_api.c 94
    Jun 24 12:16:55 juno scanimage: unable to connect hpssd socket 50002: Connection refused: prnt/hpijs/hplip_api.c 719

Not realising that HP had any involvement in scanning on Linux, I assumed that this was a port conflict with some utilities installed on our HP server, but reading into the matter further I believe that this is because the client has detected that the scanner is an HP model and has attempted to run an HP scan utility that is not installed on the client.  Just guesses, if you have any ideas, please contact me.  Any useful messages will be posted here!
