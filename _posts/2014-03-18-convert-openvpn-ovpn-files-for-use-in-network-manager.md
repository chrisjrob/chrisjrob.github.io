--- 
layout: post 
title: Convert OpenVPN OVPN Files for use in Network Manager
date: 2014-03-18
type: post 
published: true 
status: publish
category: technology
tags: [linux, vpn, openvpn, networking]
---

Anyone who has enjoyed the dubious benefits of working with IPSEC will
find [OpenVPN](http://openvpn.net/ "OpenVPN") a delight, but what do you
do with your client.ovpn file once you have it?

If you spend most of your time in a terminal anyway, then I would
suggest just putting all your client.ovpn files into `~/.openvpn`,
renaming them in some appropriate way, and then using them simply by
typing:

    $ sudo openvpn client.ovpn

<!--more-->

If, on the other hand, you live in a more graphically orientated world,
then you might like to integrate them into Network Manager. Sadly, the
Import feature in Ubuntu does not work, at least in the versions of
Ubuntu that I have used, and you have to make a few changes first.

Firstly, I would always create a hidden directory into which to store
your client files:

    $ mkdir ~/.openvpn
    $ cd ~/.openvpn
    $ mv ~/Downloads/client.ovpn ./

Secondly, you need to ensure that you have installed openvpn for
network-manager:

    $ sudo apt-get install network-manager-openvpn-gnome

Thirdly, we need to extract some data out of the client.ovpn, and for
this I followed [these
instructions](http://howto.praqma.net/ubuntu/vpn/openvpn-access-server-client-on-ubuntu "OpenVPN Access Server Client on Ubuntu"),
which I include below in case of link breakage:

1.  Open client.ovpn in your favour text editor and copy the lines
    between the \<ca\> tags into a new file named client.ca.
2.  Remove \<ca\> section including tags.
3.  Now copy the lines between the \<cert\> tags into a new file
    named client.crt.
4.  Remove \<cert\> section including tags.
5.  Now copy the lines between \<key\> tags into a new file
    named client.key.
6.  Remove \<key\> section including tags.
7.  Now copy the lines between \<tls-auth\> tags into a new file named
    client.tls.
8.  Remove \<tls-auth\> section including tags.
9.  Remove the line "key-direction 1".
10. Insert the following text above the line \# -----BEGIN RSA
    SIGNATURE----- :

<!-- -->

    ca client.ca
    cert client.crt
    key client.key
    tls-auth client.tls 1

Finally, save and close all the files and check that you now have all
the above files sitting happily in your \~/.openvpn directory.

Go to Network Manager -\> Edit Connections -\>VPN and click Import,
browse to the modified client.ovpn import that file.

Enter vpn username and password if prompted.

On the VPN page, select Advanced and on the General Tab, uncheck the
first option, "Use custom gateway.

