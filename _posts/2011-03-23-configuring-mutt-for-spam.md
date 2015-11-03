--- 
layout: post 
title: Configuring Mutt For Spam
date: 2011-03-23
type: post 
published: true 
status: publish
category: technology linux
tags: mutt email
---

I have been using Mutt for some time, but have always found it a pain
for handling spam, so I finally spent the time yesterday to work out how
to do it. The surprising thing is that there seemed to be different and
confusing advice on how to achieve this. The best information turned out
to be the [Mutt manual](http://wiki.mutt.org/?MuttGuide/Macros) itself,
which is a great example of how open source documentation should be.

<!--more-->

My folder layout is that I have a Spam folder, within which I have two
folders - Spam/Ham and Spam/Verified. The Spam/Ham are good emails,
particularly those that have been wrongly identified as Spam. The
Spam/Verified are the Spam that I am confirming are definitely Spam.
SpamAssassin places all the detected Spam in the Spam folder. I
generally move all the Spam folder into Spam/Verified except the one or
two false positives, which I move to Spam/Ham. Then overnight
[SpamAssassin](http://spamassassin.apache.org/) learns from those two
folders - a fairly standard SpamAssassin layout I think.

Occasionally we get Spam in our Inbox, and obviously these can be moved
straight to the Spam/Verified folder.

The important factor here is that I want to be able to easily flag
individual emails in my Inbox as Spam, but I also want to be able to tag
the whole of my Spam folder and flag as Spam.

The manual gives a [list of functions](http://www.mutt.org/doc/devel/manual.html#functions), which I
used rather than the normal key bindings, as the manual advises that
this is more portable and robust. I used the `tag-prefix` command to
enable tagging. I was not using the keys H nor S, so I chose these as
Ham and Spam respectively.

You need two macros for each function - one for use in the folder list
(index) and one for use inside an email message (pager), so that you can
flag it as Spam without moving back to the message list.

The biggest problem I encountered was the difficulty that removing the
unread flag resulted in the selection moving down to the next email, and
then the next email would be flagged as Spam - frustrating. The only
solution seemed to be modify the muttrc configuration before and after,
and almost unbelievably that is in fact possible using the function.

The final macros are shown below:

    # Move message(s) to Spam/Verified by pressing "S"
    macro index S "<tag-prefix><enter-command>unset resolve<enter><tag-prefix><clear-flag>N<tag-prefix><enter-command>set resolve<enter><tag-prefix><save-message>=INBOX/Spam/Verified<enter>" "file as Spam"
    macro pager S "<save-message>=INBOX/Spam/Verified<enter>" "file as Spam"
    # Move message(s) to Spam/Ham by pressing "H"
    macro index H "<tag-prefix><enter-command>unset resolve<enter><tag-prefix><clear-flag>N<tag-prefix><enter-command>set resolve<enter><tag-prefix><save-message>=INBOX/Spam/Ham<enter>" "file as Ham"
    macro pager H "<save-message>=INBOX/Spam/Ham<enter>" "file as Ham"
    # Return to Inbox by pressing "."
    macro index . "<change-folder>=INBOX<enter>" "Inbox"

Suddenly Mutt is the easiest way for me to handle by Spam.

