## VirtualBox

<<<---
%TOC%
%MENU%
<<<---



<!> The VirtualBox Open Source Edition is now in the Debian and Ubuntu repositories, so these instructions are largely redundant.

### Licensing

The full product is not open source, only free for personal and evaluation use. They do offer an open source version, but this requires compiling from source and does not include headless VRDP or automated set-up, nor USB support.

### Performance

The good news is that VirtualBox is very fast indeed, and you can activate the CPU virtual threading to make it even faster.

### Installing the Full Product

So simple, in comparison to the alternatives.

   # Either download from http://www.virtualbox.org/wiki/Downloads or follow instructions to add to apt sources
   # Install in the normal Debian way

### Creating a virtual machine

So intuitive, you can work it out for yourself.

<?> VirtualBox requires ISO files. If you have IMG files, they can simply be renamed

<?> Don't forget to turn on CPU virtual threading, if you have a suitable CPU

### Simple networking

See {Step 3: Simple networking in KVM} for more information on this method.

Simply add the two scripts below to your .VirtualBox folder (or a place of your choosing) and in the VirtualBox GUI interface, edit the settings of your virtual machine and change the networking to host networking, give the interface the name "tap0" and add the scripts below in the relevant fields.

   * Host IP: 192.168.0.17
   * TUN Interface IP: 192.168.0.18
   * Guest Interface IP: 192.168.0.19

#### Create interface

<pre>
#!/bin/sh
# vbox-ifup.sh

# configure tun0 device (UML and newer versions of Qemu use tap0 here!)
sudo /sbin/ifconfig tap0 192.168.0.18

# activate ip forwarding
sudo bash -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'

# set up routing to the guest IP
sudo route add -host 192.168.0.19 dev tap0

# activate ARP proxy to "spoof" arp address
sudo bash -c 'echo 1 > /proc/sys/net/ipv4/conf/tap0/proxy_arp'

# set "spoofed" arp address
sudo arp -Ds 192.168.0.19 eth0 pub
</pre>

#### Close interface

<pre>
#!/bin/sh
# vbox-ifdown.sh

# delete "spoofed" arp address
sudo arp -d 192.168.0.19

# deactivate ARP proxy to "spoof" arp address
sudo bash -c 'echo 0 > /proc/sys/net/ipv4/conf/tap0/proxy_arp'

# remove routing to the guest IP
sudo route del -host 192.168.0.19 dev tap0

# deactivate ip forwarding
sudo bash -c 'echo 0 > /proc/sys/net/ipv4/ip_forward'

# remove tun0 device (UML and newer versions of Qemu use tap0 here!)
sudo /sbin/ifconfig $1 down
</pre>

### References

   * {Build VirtualBox|https://help.ubuntu.com/community/VirtualBox#head-ac88c03223e773c78dbb46b4b13c109de1143a03}
   * {Complete Host Networking|http://ubuntuforums.org/archive/index.php/t-346185.html}
   * {Install SeamlessRDP|http://www.cendio.com/seamlessrdp/}
   * {Configure for seamless and headless operation|http://ubuntuforums.org/showthread.php?t=433359}
   * {Fix for multiple windows|http://ubuntuforums.org/showthread.php?t=433359&page=11}
      * http://ubuntuforums.org/showthread.php?t=224212
      * http://www.fontis.com.au/rdesktop
   * {VirtualBox Manual|http://www.virtualbox.org/download/UserManual.pdf}
   * {Concurrent Users|http://sig9.com/articles/concurrent-remote-desktop}
      * http://concurrentremotesessions.netfirms.com/
      * http://sala.pri.ee/terminal-server-patch/