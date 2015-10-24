## LTSP5 NXClient

<<<---
%TOC%
<<<---

### Warning

These instructions are for Debian Lenny.  They are my notes of what I did, and may contain errors or missed steps.

This assumes you have FreeNX installed somewhere to which to connect.  You might like to see my Install FreeNX for details.

### Instructions

These instructions are for install NoMachine's NX Client for Linux on LTSP, to enable connection to a FreeNX (or NX) server from a screen script.

### Download NXClient

Visit {NoMachine.com|http://www.nomachine.com/download.php} and !download the Debian .deb installation.  Copy the deb file into /opt/ltsp/i386/root.

### Install NXClient in chroot

%RAW%
<pre>
$ sudo chroot /opt/ltsp/i386
# cd root
# apt-get install libaudiofile0
# dpkg -i nxclient_3.3.0-6_i386.deb (or whatever the name of the file is)
# exit
</pre>
%RAW%

### Install OpenBox in chroot

Unfortunately running nxclient restarts X every time that it's about to connect.  The solution is to install a lightweight Window Manager like xfwm4 or openbox.

%RAW%
<pre>
$ sudo chroot /opt/ltsp/i386
# apt-get install openbox
# exit
</pre>
%RAW%

### Create User Settings

Easiest way is to install NXClient on the server, and run it to create your settings, then copy your /home/user/.nx directory into the chroot.

%RAW%
<pre>
$ sudo cp -r /home/userid/.nx /opt/ltsp/i386/home/
</pre>
%RAW%

Move your /home/userid/.ssh/known_hosts file sideways, and connect to any and all freenx servers that you wish to be able to use.  Then copy this file to /opt/ltsp/i386/home/.ssh/.

### Edit nx settings

Unfortunately these settings include duff information, change to /opt/ltsp/i386/home/.nx/config and edit nxclient.cfg file, change the location in the following line to:

%RAW%
<pre>
&lt;option key="Personal NX dir" value="/home/.nx" /&gt;
</pre>
%RAW%

### Create Screen Script

Create a new screen script:

%RAW%
<pre>
$ sudo nano /opt/ltsp/i386/usr/share/ltsp/screen.d/openbox
</pre>
%RAW%

And copy the following into it:

%RAW%
<pre>
#!/bin/sh

PATH=/bin:$PATH; export PATH
HOME=/home; export HOME

. /usr/share/ltsp/screen-x-common

if [ -x /usr/share/ltsp/xinitrc ]; then
    xinitrc=/usr/share/ltsp/xinitrc
fi

xinit $xinitrc /usr/bin/openbox-session -- ${DISPLAY} vt${TTY} ${X_ARGS} -br >/dev/null
</pre>
%RAW%

This script will make the root user's home directory to be /home.  I probably should have set it to /root, but when I experimented with that it didn't work correctly, I suspect I should have persevered, but I did not, with the result that I am pointing everything to /home instead.

### Make OpenBox Autostart NXClient

Create the Openbox configuration directory:

%RAW%
<pre>
$ sudo mkdir -p /opt/ltsp/i386/home/.config/openbox
</pre>
%RAW%

Then create a new file autostart.sh:

%RAW%
<pre>
$ sudo nano /opt/ltsp/i386/home/.config/openbox/autostart.sh
</pre>
%RAW%

And paste in the following:

%RAW%
<pre>
(sleep 2 && /usr/NX/bin/nxclient) &
</pre>
%RAW%

And make it executable:

%RAW%
<pre>
$ sudo chmod a+x /opt/ltsp/i386/home/.config/openbox/autostart.sh
</pre>
%RAW%

### Update lts.conf

In lts.conf, on the client you wish to test, just set SCREEN_07 = openbox.

### Reboot Client

Reboot client the and test!

### References

None, sadly.  No-one to blame but me.

### Comments

%FORM%
Name*:       [                                                         ]
Email*:      [                                                         ] Will not be published
Subject*:    [                                                         ]
Comment*:    [                                                         .....]
%FORM%

%RESULTS%
##### {mandatory_subject} by {mandatory_name} on {timestamp}:
"{mandatory_comment}"
%RESULTS%



