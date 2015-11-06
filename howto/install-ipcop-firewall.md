---
layout: page
title: Howto | Install IPCop Firewall
menu: howto
weight: 40
category: technology
tags: [linux, firewall]
---

## Introduction

This document is for the purpose of building in IPCop Firewall onto a MSI Axis 700 barebones PC.  The firewall will also be used as a NTP time-server, Content-filtering proxy server and OpenVPN server.

## Requirements

   * MSI C7 VIA CN700 5.1 Audio Lan DDRII quicklinx:[4FY9WS](https://www.dabs4work.com/productview.aspx?Quicklinx=4FY9)
   * D-Link DFE 580TX - network adapter - 4 ports quicklinx:[1YH9WS](https://www.dabs4work.com/productview.aspx?QuickLinx=1YH9)
   * LG Electronics DVD ROM 16X BLACK DRIVE ONLY quicklinx:[4N6SWS](https://www.dabs4work.com/productview.aspx?QuickLinx=4N6S)
   * Seagate Barracuda 7200.10 80GB S300 8MB quicklinx:[4MRKWS](https://www.dabs4work.com/productview.aspx?QuickLinx=4MRK)
   * Crucial 512MB 240Pin DIMM DDR2 PC2-4200 Non-ECC quicklinx: [36TCWS](http://www.dabs4work.com/productview.aspx?Quicklinx=36TC)

N.B. I believe 512mb is insufficient and I would recommend purchasing Kingston Memory - KVR667D2NG/1G

## Key Steps

   * Assemble above
   * Disable "EHCP on chip" under "Integrated peripherals" in BIOS (prevents NIC being loaded correctly)
   * Disable "ACPI" under Power Management (from memory)
   * Download IPCop at [IPCop.org](https://sourceforge.net/project/showfiles.php?group_id=40604) and burn to CD
   * Boot CD
   * Follow prompts to install (you may find this [Howtoforge](http://www.howtoforge.net/perfect_linux_firewall_ipcop) useful)
   * Connect to web admin page
   * Install Copfilter (for Virus protection and more)
   * Install Advanced Proxy (for user authentication and control)
   * Install URL Filter (for content filtering)
   * Install Zerina OpenVPN
   * Configure Zerina OpenVPN

## Install Copfilter

[Download Copfilter](http://www.copfilter.org/downloads.php).


    # scp -P 222 copfilter-version.tgz root@ipcop_green_address:/root
    # ssh -p 222 -l root ipcop_green_address
    # cd /root
    # tar xzvf copfilter-version.tgz
    # cd copfilter-version
    # ./install

This should complete with a message such as this:

    Copfilter ~version~ installation completed successfully!

## Install Advanced Proxy

[Download Advanced Proxy](http://www.advproxy.net/download.html).

    # scp -P 222 ipcop-advproxy-version.tar.gz root@ipcop_green_address:/root
    # ssh -p 222 -l root ipcop_green_address
    # tar -xzf ipcop-advproxy-version.tar.gz
    # ipcop-advproxy/install

## Install Enhanced Proxy Log Viewer

[Download Advanced Proxy Log Viewer](http://www.advproxy.net/download.html).

This package enables the capability to show usernames within the proxy log viewer. 

Copy the file `proxylog.dat` to the directory `/home/httpd/cgi-bin/logs.cgi` and set the file permissions to 755 (`rwxr-xr-x`).


## Install URL Filter Add-on

[Download URL Filter](http://www.urlfilter.net/download.html).

    # scp -P 222 ipcop-urlfilter-version.tar.gz root@ipcop_green_address:/root
    # ssh -p 222 -l root ipcop_green_address
    # tar -xzf ipcop-urlfilter-version.tar.gz
    # ipcop-urlfilter/install


## Install Zerina OpenVPN

[Zerina OpenVPN](http://www.openvpn.eu/index.php?id=35).

If you are updating, first stop the OpenVPN Server through the GUI.

These instruction include a dangerous bodge to arbitrarily alter the IPCop version requirement, only proceed if you are happy to accept the inherent risk in so doing.

    # scp -P 222 ZERINA-version-Installer.tar.gz root@ipcop_green_address:/root
    # ssh -p 222 -l root ipcop_green_address
    # mkdir /root/zerina
    # mv ZERINA-version-Installer.tar.gz /root/zerina/
    # cd /root/zerina
    # tar -xzvf ZERINA-version-Installer.tar.gz
    # sed -i s/1\.4\.18/1.4.21/ install
    # ./install

## Configure Zerina OpenVPN

   * [Zerina OpenVPN](http://www.zerina.de/zerina/?q=documentation/howto-roadwarrior)

## Configure OpenVPN for Network-Manager

Download and extract the ZIP file from IPCOP OpenVPN, and extract the contents into (for example `~/.openvpn`).

    $ sudo apt-get install network-manager-openvpn
    $ cd ~/.openvpn
    $ sudo su
    # openssl pkcs12 -nocerts -in default.p12 -out key.pem
    # openssl pkcs12 -nokeys -clcerts -in default.p12 -out cert.pem
    # openssl pkcs12 -nokeys -cacerts -in default.p12 -out ca.pem
    # exit

These converted files can then be used in Network Manager.

If you're struggling to connect to OpenVPN with Network Manager, consider that you need to ensure that the settings are mirrored on both IPCop and on the client's Network Manager, for example I struggled to connect until I realised that LZO Compression was switched on on IPCop but off in Network Manager.

## Static Routes

There is no way to set this in the GUI, so connect via SSH (see above):

In `/etc/rc.d/rc.netaddress.up` add:

    if [ "$1" != "NOTGREEN" ]; then
    if [ "$GREEN_DEV" != "" ]; then
        ifconfig $GREEN_DEV $GREEN_ADDRESS netmask $GREEN_NETMASK broadcast $GREEN_BROADCAST up

        ####CUSTOM EDIT FOR STATIC ROUTE####
        route add -net 10.100.1.0 netmask 255.255.255.0 gw 10.2.0.1
        ####CUSTOM EDIT FOR STATIC ROUTE####

## Identifying Network Interfaces in Linux

If your network card supports it, you can blink the LED on the specified network interface in Linux like this:

    # ethtool -p eth# 5

This blinks the LED on the interface for five seconds-without interrupting network traffic.

   * [Cool Command](http://www.coolcommands.com/index.php?option=com_cc&task=display&id=1287)

## Flushing the DNS Cache

There may be times that you wish to flush the DNS cache.  IPCop uses dnsmasq, log onto ipcop using root and run the following:

    # ps -ef | grep dnsmasq
    # kill -s SIGHUP &lt;PID&gt; (replacing &lt;PID&gt; with the PID shown by the previous command)

## References

   * [IPCop.org](http://ipcop.org/)
      * [User forum](http://marc.info/?l=ipcop-user)
   * [Howtoforge](http://www.howtoforge.net/perfect_linux_firewall_ipcop)
      * [Continued...](http://howtoforge.net/perfect_linux_firewall_ipcop_p2)
   * [Addons](http://firewalladdons.sourceforge.net/cop.html)
   * [DansGuardian](http://dansguardian.org/)
   * [IPTables on Wikipedia](http://en.wikipedia.org/wiki/Iptables)
   * [IPCop Review](http://www.securityfocus.com/infocus/1556)
   * [Snort](http://www.snort.org/)
   * [Installing OpenVPN](http://ipcop.org/index.php?module=pnWikka&tag=OpenVPNHowto)
   * [Resolving add-on conflicts](http://copfilter.endlich-mail.de/viewtopic.php?t=1069&highlight=havp+dansguardian)

