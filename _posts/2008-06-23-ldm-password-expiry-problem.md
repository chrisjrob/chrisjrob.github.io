---
layout: post
title:  "LDM password expiry problem"
date:   2008-06-23 00:00:00
category: technology 
tags: [linux, ltsp, password]
---

I have had my first user's password expire since our LTSP5 Upgrade.

  1. User enters username and hits enter
  2. User enters password and hits enter
  3. LDM tells user password has expired enter new password
  4. User enters new password and hits enter
  5. LDM tells user to verify password
  6. User enters new password again and hits enter

<!--more-->

And then it enters a crazy loop where it just continually prompts for the password.  If you reboot the client you start from the beginning again, so clearly the password change has not been accepted.  I confidently told user that he had obviously entered his password incorrectly - I then rebooted the client and did exactly the same myself.  I believe this could be a bug, and I suspect it may be related to the following thread:

   * [ldm problems with debian etch](http://marc.info/?t=121069447400001&r=1&w=2)

