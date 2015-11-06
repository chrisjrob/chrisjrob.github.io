## Install FreeNX

<<<---
%TOC%
##### Related
%MENU%
<<<---

### Introduction

Installing from Ubuntu onto Debian Lenny seems sub-optimal, but is quick and dirty.

### Step 1 - Add sources

%RAW%
<pre>
deb http://ppa.launchpad.net/freenx-team/ppa/ubuntu intrepid main
deb-src http://ppa.launchpad.net/freenx-team/ppa/ubuntu intrepid main
</pre>
%RAW%

### Step 2 - Install FreeNX in Debian

<pre>
# aptitude update
# aptitude install freenx
</pre>

### Step 3 - Connecting

To connect, you need to download the NoMachine client.  If you have issues with the arrow/cursor keys, please see:

   * Fix nxclient arrow keys

### References

   * {FreeNX|http://freenx.berlios.de/info.php}
   * {FreeNX on Debian Wiki|http://wiki.debian.org/freenx} <<-- Read this
   * {FreeNX on DebianHelp|http://www.debianhelp.co.uk/freenx.htm}
   * {FreeNX on LTSP|http://www.telemedia.ch/publ/ltsp-howto.html}
      * {FreeNX|http://www.telemedia.ch/publ/freenx-setup-howto.html}
   * {NoMachine|http://www.nomachine.com/}

