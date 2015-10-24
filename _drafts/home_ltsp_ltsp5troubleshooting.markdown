## LTSP5 Troubleshooting

<<<---
%TOC%
%MENU%
<<<---

### Job control turned off nbd0 not found

<!> These instructions do not apply for Ubuntu

If you receive an error message stating initramfs "job control turned off", then look further up for a line stating that /path/to/nbd0 not found.  If you're on Debian then this is an indication that the client is trying to boot via NBD instead of NFS.  Check the following:

Firstly, see if there is a directory "/opt/ltsp/i386/images", this is the default directory for the ltsp-update-image generated unionfs files.  If it exists you should probably delete it, reboot the client and all may be well.

If not, then on the server, use the chroot command to maintain the LTSP chroot:

%RAW%
<pre>
$ sudo chroot /opt/ltsp/i386
</pre>
%RAW%
                                 
Now edit /etc/default/ltsp-client-setup and change the value of the root_write_method variable to use bind mounts instead of unionfs, it should look like this afterwards:

%RAW%
<pre>
root_write_method="bind_mounts"
</pre>
%RAW%
                                  
Next, create the file /etc/initramfs-tools/conf.d/ltsp and add the following line (set the value of the BOOT variable to nfs):

%RAW%
<pre>
BOOT=nfs
</pre>
%RAW%
                                  
Regenerate the initramfs:

%RAW%
<pre>
update-initramfs -u
</pre>
%RAW%
                                  
Hit CTRL-D to exit the chroot now. Make sure LTSP uses the new initramfs to boot:

%RAW%
<pre>
$ sudo ltsp-update-kernels
</pre>
%RAW%

### Clients cannot login via LDM

If your clients get to the LDM login page, but none of them can login, and particularly if you are aware of recent updates affecting ssh, then:

%RAW%
<pre>
$ sudo ltsp-update-sshkeys
$ sudo ltsp-update-image  (skip this for debian*)
</pre>
%RAW%

*It is important that you do not ltsp-update-image for debian (unless you have moved to nbd in which case you presumably know what you are doing), if you do, then you are likely to find that the client will attempt to boot from the generated image.

See https://bugs.launchpad.net/ubuntu/+source/ltsp/+bug/144296  for more details (which may not be relevant for Debian).

### No client sound

See {LTSP5 Client Sound}.

### Display Problems

See {LTSP5 Display Troubleshooting}.

### Client has loud hissing noise

The microphone has likely been activated by default.  With normal PCs the user fixes the problem once and that fix it remembered, with LTSP the problem repeats on every boot.  The solution is to mute the microphone on every boot.  To achieve this we need to login to the client shell and run "alsamixer" to mute the microphone.  Silence, ah bliss.  Take a note of the name of the microphone audio channel.  The amixer program is also very helpful - see LTSP5 Client Sound for details of how to use this.

Next set the volume on this channel in lts.conf:

Volume parameters take the form of:

"channel_name"_VOLUME, where "channel_name" is the name of the audio channel (you can find audio channel names by running alsamixer or "amixer -c0 scontrols" at a client shell) with unfriendly variable characters replaced or removed.  In other words, forward slashes, hyphens, and spaces are replaced by underscores, and anything in parentheses is dropped completely.

So, if you have a channel called "Front Mic", then FRONT_MIC_VOLUME should already work with no need for special scripts.

Thanks to Gadi for explaining this on the LTSP mailing list.

### LDM only prompts for password on login failure

Login window asks for Username and then Password.  But, if you enter the username incorrectly then it says "Password incorrect. Try again.".  Of course, no password will work because the username is wrong.

Edit /opt/ltsp/i386/etc/ssh/ssh_config and add this line to the bottom:

<pre>
    NumberOfPasswordPrompts 1
</pre>

Then for Ubuntu or NBD setups (not Debian) run:
<pre>
$ sudo ltsp-update-image
</pre>

Then reboot your thin client.

Credit to Gavin McCullagh from the Edubuntu mailing list for this workaround ({read more|https://lists.ubuntu.com/archives/edubuntu-users/2007-November/002636.html}).

### LDM password expiry loop

There is an odd loop that arises with the LDM password expiry process:

   * User enters username and hits enter
   * User enters password and hits enter
   * LDM tells user password has expired enter new password
   * User enters new password and hits enter
   * LDM tells user to verify password
   * User enters new password again and hits enter

It seems that after this process it always returns "No response from server", and usually logging in with your the password will work just fine.  Unfortunately the error leads people to think that the password change has failed and they seem unable to resolve the problem.

But on other occasions, typing the new password does not work, but it is possible that the operator set the password incorrectly.

If there is a bug, it may be related to the following thread:

   * {ldm problems with debian etch|http://marc.info/?t=121069447400001&r=1&w=2}

### LDM login screen shows white background

In Debian Etch, the LDM login screen shows a white background with an ugly LTSP logo in the middle.  Actually the background is a light grey, but people describe it as white.  The LTSP logo was not designed to work with a light grey background, and that's the reason it looks so ugly.  This problem has been fixed in Debian Lenny, and you should now upgrade from Etch.

No known workaround at this time, but see !howto Create a custom LDM theme for details of how to change the logo, which really is the only issue with the grey background.

### LTSPFS mounts appear strange when running df

util-linux 2.13 fixed this bug; however it is still present in etch. workaround is to make /etc/mtab a symlink to /proc/mounts:

%RAW%
<pre>
# mv /etc/mtab /etc/mtab.old
# ln -s /proc/mounts /etc/mtab
</pre>
%RAW%

### LTSP client hostname displays as (none)

Workaround set up dns on the thin-client network, or:

%RAW%
<pre>
# mv /etc/mtab /etc/mtab.old
# ln -s /proc/mounts /etc/mtab
</pre>
%RAW%

### LDM support for mostly insecure logins (LDM_DIRECTX)

Requires getting /root to be writeable:

%RAW%
<pre>
# echo 'copy_dirs="$copy_dirs /root"' >>/opt/ltsp/i386/etc/default/ltsp-client-setup
</pre>
%RAW%

### KDE local device icons on desktop

In KDE there may not be any local device icons appearing on the desktop.  If you find this to be the case, but the device does exist under /media, then you may need to script  /usr/sbin/ltspfsmounter code to create symlinks on ~/Desktop.

### X Configuration

If X doesn't automatically configure properly (it uses X.org's built-in configuration, which doesn't work as well on the version on X.org in etch), you may want to switch back to the slower but more reliable X configuration using xdebconfigurator:

%RAW%
<pre>
# chroot /opt/ltsp/i386 apt-get install xdebconfigurator
# cp /opt/ltsp/i386/usr/share/doc/ltsp-client-core/examples/configure-x-xdebconfigurator.gz /opt/ltsp/i386/etc/
# gunzip /opt/ltsp/i386/etc/configure-x-xdebconfigurator.gz
# chmod +x /opt/ltsp/i386/etc/configure-x-xdebconfigurator
# echo CONFIGURE_X_COMMAND=/etc/configure-x-xdebconfigurator >> /opt/ltsp/i386/etc/lts.conf
# echo 'copy_dirs="$copy_dirs /var/cache/debconf"' >> /opt/ltsp/i386/etc/default/ltsp-client-setup
# echo 'temp_copy_dirs=" "' >> /opt/ltsp/i386/etc/default/ltsp-client-setup
</pre>
%RAW%
