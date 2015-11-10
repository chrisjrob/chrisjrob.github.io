---
layout: post
title: Howto | OpenVZ Notes
menu: howto
date: 2010-10-05 13:09:30
weight: 40
category: technology
tags: [howto, linux, openvz]
---

## Warning

This is just an aide-memoire, please don't try and follow it.

## Creating a template

    # rm -f /etc/ssh/ssh_host_*
    cat << EOF > /etc/rc2.d/S15ssh_gen_host_keys
    #!/bin/bash
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa -N ''
    ssh-keygen -f /etc/ssh/ssh_host_dsa_key -t dsa -N ''
    rm -f \$0
    EOF
    # chmod a+x /etc/rc2.d/S15ssh_gen_host_keys

<!--more-->

## Tip re. freenx-server

You will need to reconfigure the freenx-server:

    $ sudo dpkg-reconfigure freenx-server

## Updating template

    $ sudo vzctl enter XXX
    $ sudo apt-get clean
    $ exit
    $ sudo vzctl set XXX --ipdel all --save
    $ sudo vim /var/lib/vz/private/XXX/etc/resolv.conf
    $ sudo rm -f /var/lib/vz/private/XXX/etc/hostname
    $ sudo vzctl stop XXX
    $ cd /var/lib/vz/private/XXX
    $ tar --numeric-owner -zcf /var/lib/vz/template/cache/debian-5.0-i386-minimal.tar.gz .

## Create configuration template for 10 vms

    $ sudo vzsplit -n 10 -f vps.tenth

## Create new vm

    sudo vzctl create XXX --ostemplate debian-5.0-i386-minimal --config vps.basic
    sudo vzctl create XXX --ostemplate debian-5.0-i386-kde --config vps.tenth
    sudo vzctl start XXX
    sudo vzctl set XXX --ipadd 192.168.0.XXX --save
    sudo vzctl set XXX --nameserver 192.168.0.254 --save
    sudo vzctl set XXX --onboot yes --save
    sudo vzctl set XXX --hostname server-XXXXXX.example.co.uk --save
    sudo vzctl set XXX --diskspace $(( 1048576*2 )):$(( 1153434*2 )) --save
    sudo vzctl set XXX --diskspace 10G:11G --save
    vzcfgvalidate /etc/vz/conf/XXX.conf

## Other tricks

    sudo vzctl start XXX
    sudo vzctl exec XXX passwd
    sudo vzctl exec XXX ps aux
    sudo vzctl enter XXX
    sudo vzctl stop XXX

## Removing a vm

    $ sudo vzctl destroy XXX
    $ sudo rm /etc/vz/conf/XXX.conf.destroyed

## List running and non-running

    sudo vzlist -a

## Memory use

### Check memory usage for guest 103

    $ sudo vzcalc -v 103

### Set minimum memory 256 x memory wanted

    $ sudo vzctl set vpsid --vmguarpages $((256 * 256)) --save

### Set maximum memory 256 x memory wanted

    $ sudo vzctl set vpsid --privvmpages $((256 * 1024)) --save

## References

   * http://wiki.openvz.org/Debian_template_creation
   * http://wiki.openvz.org/Resource_shortage
   * http://www.linux.com/archive/feature/114214
