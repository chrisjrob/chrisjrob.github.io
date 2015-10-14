---++ 19/12/2008: Debian Lenny - Some simple performance improvements

After setting up my Eee PC on Debian and following the tips (see 08/12/2008: Lenny on Speed ) to maximise performance, I have found the same tips quite effective on other Debian systems.  The key changes are as follows:

---++++ Add a ramdisk file system for /tmp

%RAW%
<pre>
/etc/fstab:
tmpfs      /tmp     tmpfs      defaults     0    0
</pre>
%RAW%

---++++ Add a ramdisk file system for /var/run and /var/lock

%RAW%
<pre>
/etc/default/rcS:
RAMRUN=yes
RAMLOCK=yes
</pre>
%RAW%

---++++ Add relatime option to hard disk file systems

Lastly, in /etc/fstab, add the following option to each hard disk based filesystem "relatime".  This is really important, as this stops the system from recording when a file was last read; without this option set, every time a file is read on your system, it is written to with the date last read - effectively changing a read into a read/write and thus slowing down the system.  Adding the relatime option cuts this nonsense out and makes a surprising performance improvement.

%RAW%
<pre>
# /etc/fstab: static file system information.
#
# <file system> <mount point>   <type>  <options>                   <dump>  <pass>
proc            /proc           proc    defaults                      0       0
/dev/sda1       /               ext3    errors=remount-ro,relatime    0       1
/dev/sda6       /home           ext3    defaults,relatime             0       2
/dev/sda5       none            swap    sw                            0       0
/dev/scd0       /media/cdrom0   udf,iso9660 user,noauto               0       0
/dev/fd0        /media/floppy0  auto    rw,user,noauto                0       0
tmpfs           /tmp            tmpfs   defaults                      0       0
</pre>
%RAW%

---++++ Using a faster system shell

By default, the standard system shell /bin/sh is provided by bash. Bash is very slow at startup, because it does quite a lot of things before it starts to process shell statements. During bootup, a lot of shell scripts are executed, and switching to a quicker shell has a noticeable impact. To switch /bin/sh to point at dash, install the package and use dpkg-reconfigure to enable it as the default system shell.

%RAW%
<pre>
$ aptitude install dash
$ dpkg-reconfigure dash
</pre>
%RAW%

Thanks to http://wiki.debian.org/ for these tips.
