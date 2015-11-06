## SeamlessRDP

<<<---
%TOC%
<<<---

### Warning

Please do not use this page, instead visit the following:

   * Cendio at http://www.cendio.com/seamlessrdp/
   * Fontis at http://www.fontis.com.au/rdesktop

Please do not read further, as following is repeat of the above information for my personal use.

### Cendio SeamlessRDP

<!> Please do not read this section, instead refer to the source at Cendio.com.  This is probably outdated information and is for my personal use only.

The Cendio SeamlessRDP component has two halves, a Windows executable as the "server component" for installation on the Windows server, and patches to the rdesktop application, to work with the server component.  At the time of writing, these Cendio patches have now been merged into the rdesktop 1.5.0 and later core.

   * You can download the source from http://rdesktop.svn.sourceforge.net/viewvc/rdesktop/seamlessrdp/trunk/ using Subversion.
   * You can get a binary from http://www.cendio.com/seamlessrdp/seamlessrdp.zip and unzip the files to c:\seamlessrdp (or similar).

Once you have a binary on your Windows server, then from you Linux client, type:

%RAW%
<pre>
$ rdesktop -A -s "c:\seamlessrdp\seamlessrdpshell.exe notepad"
</pre>
%RAW%

<!> Under W2K8, both seamlessrdpshell.exe, and the Windows application you wish to run with it, must be published terminal services applications.  And seamlessrdpshell.exe must have command line parameters enabled, by running "TS RemoteApp Manager's" "Add RemoteAppProgram" dialog (remoteprograms.msc).

### Fontis SeamlessRDP

<!> Please do not read this section, instead refer to the source at Fontis.com.au.  This is probably outdated information and is for my personal use only.

Fontis have further developed Cendio SeamlessRDP, to enable connection sharing, allowing a single rdesktop connection to launch multiple applications.  When run in seamless mode, rdesktop creates and listens on a control socket.  A new option allows rdesktop to be run in slave mode, which notifies the master rdesktop instance of a new command to be run and then exits.  The master instance sends a client-to-server message to the SeamlessRDP server component, which runs the new command.

I see this development as fairly fundamental to the use of SeamlessRDP.

#### Installation of Fontis patch

Download source for the latest version of rdesktop from CVS (press enter when prompted for a password): 

%RAW%
<pre>
$ cvs -d:pserver:anonymous@rdesktop.cvs.sourceforge.net:/cvsroot/rdesktop login
$ cvs -z3 -d:pserver:anonymous@rdesktop.cvs.sourceforge.net:/cvsroot/rdesktop co -P rdesktop
</pre>
%RAW%

Alternatively, download the {rdesktop CVS snapshot|http://www.fontis.com.au/system/files/rdesktop_src.tar.gz} which has been tested with the patch.  Download the rdesktop patch to the checked out directory:

%RAW%
<pre>
$ cd rdesktop $ wget http://www.fontis.com.au/system/files/rdesktop.patch
</pre>
%RAW%

Apply the patch and compile:

%RAW%
<pre>
$ patch -p1 < rdesktop.patch
$ ./bootstrap
$ ./configure
$ make
</pre>
%RAW%

Download updated server component and unpack. Alternatively, obtain the seamlessrdp CVS snapshot or download direct from CVS, apply the seamlessrdp patch and then compile:

%RAW%
<pre>
$ cvs -z3 -d:pserver:anonymous@rdesktop.cvs.sourceforge.net:/cvsroot/rdesktop co -P seamlessrdp
$ patch -p1 < seamlessrdp.patch
</pre>
%RAW%

#### Usage

The following examples assume the SeamlessRDP server component files (seamlessrdpshell.exe, seamlessrdp.dll and vchannel.dll) have been unpacked to C:\seamlessrdp\. 
To start a SeamlessRDP session, invoke rdesktop in the same way as before applying the patch:

%RAW%
<pre>
$ ./rdesktop -A -s "C:\seamlessrdp\seamlessrdpshell.exe notepad" server
</pre>
%RAW%

To run a new command inside the existing SeamlessRDP session: 

%RAW%
<pre>
$ ./rdesktop -l "calc"
</pre>
%RAW%

New command-line options:

   * -M: Specify the path for the control socket that the rdesktop process listens on. By default, this is $HOME/.rdesktop/seamless.socket
   * -l: Instead of starting a new rdesktop process, connect to an existing process' control socket and tell it to run a command on the server. Can be combined with the -M option to use a non-standard socket.
