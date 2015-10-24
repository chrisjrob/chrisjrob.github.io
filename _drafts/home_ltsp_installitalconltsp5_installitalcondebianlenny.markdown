## Install Italc on Debian Lenny

<<<---
%TOC%
<<<---

### Warning

After completing this installation, the clients received an error on login about port 5900 already in use.  Upgrading italc-client (by temporarily adding the sid repository to /etc/apt/source.list in the chroot and re-installing italc-client) fixed this problem.

However, I was unable to get an acceptable performance from italc for shadowing, and ended up install x11vnc.  See {Install x11vnc on LTSP5} for more information.

### Install italc-client in chroot

%RAW%
<pre>
$ sudo chroot /opt/ltsp/i386
# mount -t proc /proc /proc
# mount -t sysfs sys /sys
# apt-get install italc-client
# umount sys
# umount /proc
# exit
</pre>
%RAW%

<?> If you are using ubuntu rather than debian, or have switched to nbd instead of nfs, remember to do an ltsp-update-client after leaving the chroot.

### Install italc-master on server

%RAW%
<pre>
$ sudo apt-get install italc-master
</pre>
%RAW%

### Generate Key Pairs

%RAW%
<pre>
$ sudo ica -role teacher -createkeypair
</pre>
%RAW%

<!> I tried in vain to stipulate -role admin - could not get the keys to work

### Set Permissions

%RAW%
<pre>
$ sudo addgroup italc
$ sudo addgroup <userid> italc
$ sudo chgrp -R italc /etc/italc/keys
$ sudo chmod -R 640 /etc/italc/keys/private/
$ sudo chmod -R ug+X /etc/italc/keys/private/
</pre>
%RAW%

### Transfer keys to client

<?> This assumes a standard /opt/ltsp/i386 chroot, change path to suit your installation

%RAW%
<pre>
$ sudo mkdir /opt/ltsp/i386/etc/italc/keys
$ sudo cp -r /etc/italc/keys/public /opt/ltsp/i386/etc/italc/keys/
</pre>
%RAW%

### Create client start script

Enter the chroot:

%RAW%
<pre>
$ sudo chroot /opt/ltsp/i386
</pre>
%RAW%

And create the following script:

%RAW%
<pre>
#!/bin/sh
# /usr/share/ldm/rc.d/S20-ica-launcher
/usr/bin/ica &
true
</pre>
%RAW%

### Test

Reboot client
Log into client
Open a terminal on the server and run /usr/bin/ica -noshm
Run italc

### References

   * https://help.ubuntu.com/community/UbuntuLTSP/iTalc
   * http://indianalinux.blogspot.com/2007/02/howto-install-italc-from-source-on.html
   * http://wiki.ubuntu-fi.org/LTSP5_iTalc (Finnish)
   * http://www.mail-archive.com/debian-edu@lists.debian.org/msg15477.html
