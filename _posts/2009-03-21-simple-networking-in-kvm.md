---
layout: post
title: Howto &#124; Simple networking in KVM
menu: howto
date: 2009-03-21 05:32:36
weight: 40
category: technology
tags: [linux, howto, networking, virtualisation]
---

Most instructions on the web are suggesting setting up bridging and setting the interface to work in promiscuous mode; which I understand has security implications. I came across [this website](http://calamari.reverse-dns.net:980/cgi-bin/moin.cgi/QemuOnLinux) which seemed to promise a simple alternative, by which instead of bridging the networks we just advertise the presence of the guest interface. It seems to work well as far as I can tell.

<!--more-->

## Configuration

 * Host IP: 192.168.0.17
 * TUN Interface IP: 192.168.0.18
 * Guest Interface IP: 192.168.0.19

I went into windows and provisioned the emulated ethernet interface with an IP address of 192.168.0.19; along with appropriate DNS settings and default gateway settings. I've also reserved the address 192.168.0.18 for use by the tunnel device.

My `/etc/qemu-ifup` looks like this:

```sh
#!/bin/sh
# configure tun0 device (UML and newer versions of Qemu use tap0 here!)
sudo /sbin/ifconfig $1 192.168.0.18

# activate ip forwarding
sudo bash -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'

# set up routing to the guest IP
sudo route add -host 192.168.0.19 dev tap0

# activate ARP proxy to "spoof" arp address
sudo bash -c 'echo 1 > /proc/sys/net/ipv4/conf/tap0/proxy_arp'

# set "spoofed" arp address
sudo arp -Ds 192.168.0.19 eth0 pub
```

Thats it... The bridging is done only for a single IP address by installing a proxy ARP.

## Running

    $ sudo kvm -hda w2k3.img -smp 2 -m 512 -no-acpi -k en-gb -net nic,model=rtl8139 -net tap,script=/etc/qemu-ifup -usb -usbdevice tablet -snapshot

   * Note that you must sudo the command, as root priority is required for the qemu-ifup script.
   * Note also that for some reason under KVM you need to specify the qemu-ifup script, as it does not default to that. I suspect that it defaults to kvm-ifup, but I have not looked into this further.
   * The USB switch is useful in that it enables the mouse to leave the virtual window, and also seems to synchronise the host/guest cursors, which was a problem on our installation.

## References

   * [QEMU](http://fabrice.bellard.free.fr/qemu/)
   * [QEMU Networking](http://calamari.reverse-dns.net:980/cgi-bin/moin.cgi/QemuOnLinux)
      * [QEMU Setup Hints](http://www.cnpbagwell.com/QEMU/HomePage)
