--- 
layout: post 
title: Howto | Add ActiveDirectory Addressbook to Sylpheed Email
date: 2015-11-19 21:00:00
type: post 
category: technology
tags: [howto, linux, email, activedirectory, ldap, sylpheed]
image: sylpheed.png
---

Where we require a lightweight mail client, we tend to use [Sylpheed], a fork of the old Claws Mail.

It seems unlikely that you would be able to add an ActiveDirectory Address Book into such a lightweight email client, and indeed the [manual] states:

    ### FIXME: write this part.

But in fact it was trivially easy:

<!--more-->

## Caveat

Whilst these instructions worked for us, do be aware that we are using Samba4 ActiveDirectory. 
In theory this is a drop-in replacement for Windows ActiveDirectory and these instructions *should* work unchanged.

## Add LDAP Addressbook

Firstly run Sylpheed and go to Tools and Addressbook. 
Within the Sylpheed Addressbook go to File New LDAP Server
You should now see a screen like this:

<img src="/assets/sylpheed-ldap-1.png" alt="Sylpheed LDAP Basic Settings">

Having entered the Name, Hostname and Port you are able to "Check Server", to ensure connectivity.
Next either enter your Search Base, or click on the &ellipsis; button to select from the detected Search Bases. 

| Item        | Explanation                 | Example           |
|-------------+-----------------------------+-------------------|
| Name        | Addressbook or server name  | example           |
| Hostname    | ActiveDirectory Host Name   | ads.example.lan   |
| Port        | LDAP Port Number*           | 389 or 636        |
| Search Base | Your AD domain in LDAP form | DC=example,DC=lan |

*You should probably choose 636 when connecting via a public network, and you may need to open ports on your router.

Now select the Extended tab and you should see the following screen:

<img src="/assets/sylpheed-ldap-2.png" alt="Sylpheed LDAP Extended Settings">

| Item            | Explanation                       | Example           |
|-----------------+-----------------------------------+-------------------|
| Search Criteria | This simple example worked for us | (objectclass=*)   |
| Bind DN         | Your ActiveDirectory username     | chris@example.lan |
| Bind Password   | Your ActiveDirectory password     | - |

Now click on OK to finish.

## Test

You should now have a Search field available, enter a colleague's first name and Search and you should be faced with their email addresses.

## Conclusion

As far as I can tell the addressbook lookup is not automatic and you have to click on the addressbook icon in the Compose Window and search for the person, in order to add them to the To: field. A bit clunky perhaps, but arguably not so very different from the need in Outlook to press Check Names to look up new addresses. 
Needless to say - once the address is in the recent address list, it is auto-completed in the future.

[sylpheed]: http://sylpheed.sraoss.jp/en/
[manual]: http://sylpheed.sraoss.jp/doc/manual/en/sylpheed-12.html
