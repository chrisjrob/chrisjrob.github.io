--- 
layout: post 
title: Sharing A Wireless Connection Via Ethernet Port
date: 2011-03-14
type: post 
published: true 
status: publish
category: technology
tags: [linux, network, wireless]
---

One of the challenges in 
[Installing Debian on a thin client PC]({% post_url 2011-03-13-installing-debian-on-a-thin-client-pc %}) was that the
venue had a guest wireless network, but no wired network, and clearly
these thin client devices did not have wireless capability.

Mike sorted this out by setting up IP forwarding on his laptop, so that
we had a wired network which used his wireless connection as a gateway.
I knew this was technically possible, but I had not actually seen it
done before.

<!--more-->

So this morning I sought out suggestions from the 
[Surrey LUG Mailing List](http://mailman.lug.org.uk/mailman/listinfo/surrey), and the
following was the end result.

Please note that this solution is as-yet untested by me and involves
changing your existing iptables rules - albeit only until you reboot.

Assuming eth0 is your LAN port and wlan0 is your wireless WAN port, and
that you have connected your client PC to your host PC with a 
[crossover ethernet cable](http://www.amazon.co.uk/gp/product/B000Q6JQCQ/ref=as_li_ss_tl?ie=UTF8&tag=robsquadnet-21&linkCode=as2&camp=1634&creative=19450&creativeASIN=B000Q6JQCQ)
(or perhaps via a [dedicated switch](http://www.amazon.co.uk/gp/product/B0000E5SEQ/ref=as_li_ss_tl?ie=UTF8&tag=robsquadnet-21&linkCode=as2&camp=1634&creative=19450&creativeASIN=B0000E5SEQ)),
then the following instructions should work:

On the Laptop
-------------

On the laptop, which is assumed to have a working wireless connection,
and a wired connection to the Client PC:

Firstly, you will probably need to set some static IP details:

    # ifdown eth0
    # ifconfig eth0 192.168.10.1 netmask 255.255.255.0

Next we need to activate IP forwarding, and setup iptables to NAT:

    # sysctl -w net.ipv4.ip_forward=1
    # iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE

The following may be worth trying if the client gets Host Prohibited
responses:\

    # iptables -F FORWARD 
    # iptables -A FORWARD -j ACCEPT 
    # iptables -nvL

DNS and DHCP
------------

If you plan to do this regularly, then you might consider using dnsmasq
to provide a DNS nameserver and DHCP to your client PC. If you do this,
then you should not complete the next section entitled "On the Client
PC", which should just pick up its details using DHCP. This method is
particularly handy with a Debian net install.

    # apt-get install dnsmasq 
    # vim /etc/dnsmasq.conf interface=eth0 dhcp-range=192.168.10.10,192.168.10.19,4h 
    # /etc/init.d/dnsmasq restart

On the Client PC
----------------

Do not carry out this section, if you configured dnsmasq above.

On the client PC, which is assumed to have a wired connection to the
laptop, all you need do is configure static IP networking and add a
working nameserver to /etc/resolv.conf (normally populated via
dhcp-client):\

    $ sudo -i
    # ifdown eth0
    # ifconfig eth0 192.168.10.10 netmask 255.255.255.0 gateway 192.168.10.1
    # echo "nameserver 8.8.8.8" > /etc/resolv.conf

Finishing up
------------

When you're finished, you should comment out the lines in
`/etc/dnsmasq.conf` and reboot, and you should be back to normal again.

I am really looking forward to testing this set-up; so in the meantime
if you get it working, please do let me know. Any suggestions for
improvement - please do feel free to comment.

