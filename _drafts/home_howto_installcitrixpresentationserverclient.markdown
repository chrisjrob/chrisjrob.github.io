## Install Citrix Presentation Server Client

<<<---
%TOC%
<<<---

### Install OpenMotif

Before installing Citrix presentation server, you need to install OpenMotif.

<pre>
$ apt-get libmotif3
</pre>

Unfortunately this is not available in Etch, so you have to get it from unstable. Add unstable to the source.list and install as follows:

<pre>
$ apt-get -t "sid" libmotif3
</pre>

### Create a dummy libXm.so.4

libmotif3 only provides libXm.so.3, but libXm.so.4 is required:

<pre>
$ sudo ln -s /usr/lib/libXm.so.3 /usr/lib/libXm.so.4
</pre>

### Download client from Citrix

Decide whether you wish to do an alien/rpm install, which will give you an easy uninstall method, or a standard binary installation. Currently my preference is the binary installation using checkinstall. Download the appropriate file from:

   * http://www.citrix.com/English/SS/downloads/details.asp?downloadID=3323&productID=-1

### Binary Installation

If you decide to do a simple binary install, then simply extract the downloaded file and execute setup/install executable.  I suggest you use the checkinstall program.

<pre>
$ sudo checkinstall ./setupwfc
</pre>

### Alien Installation

<!> I have not tested this method for the latest Citrix Receiver 11 software

Alternatively download the rpm package and convert using alien:

<pre>
# sudo alien ICAClient-10.6-1.i386.rpm
# sudo dpkg --install icaclient_10.6-2_i386.deb
# /usr/lib/ICAClient/wfcmgr
</pre>

### Client Hostname

~Is the client name configurable in UNIX clients or must it assume the host name?~

The client name can be configured (though not through the user interface). A ClientName= entry can be placed in either the [WFClient] section of wfclient.ini, in the relevant description section of appsrv.ini, or in both. An appsrv.ini entry takes precedence over any wfclient.ini entry. If no name is specified, the default name is the host name.

<pre>
$ cd ~/.ICAClient
$ cat wfclient.ini | grep Name
ClientName=ltsp_cjr    
</pre>

### Sound

   * http://ltsp.sourceforge.net/contrib/ica/ica-howto.html#audio
