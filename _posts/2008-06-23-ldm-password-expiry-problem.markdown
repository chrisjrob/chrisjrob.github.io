---
layout: post
title:  "LDM password expiry problem"
date:   2008-06-24 00:00:00
categories: ltsp linux ldm password
---

I have had my first user's password expire since our LTSP5 Upgrade.

   * User enters username and hits enter
   * User enters password and hits enter
   * LDM tells user password has expired enter new password
   * User enters new password and hits enter
   * LDM tells user to verify password
   * User enters new password again and hits enter

And then it enters a crazy loop where it just continually prompts for the password.  If you reboot the client you start from the beginning again, so clearly the password change has not been accepted.  I confidently told user that he had obviously entered his password incorrectly - I then rebooted the client and did exactly the same myself.  I believe this could be a bug, and I suspect it may be related to the following thread:

   * [ldm problems with debian etch](http://marc.info/?t=121069447400001&r=1&w=2)

