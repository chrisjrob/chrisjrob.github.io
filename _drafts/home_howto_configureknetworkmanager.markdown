## Configure KNetworkManager

<<<---
%TOC%
<<<---

### The Issue

KNetworkManager does not like inheriting a pre-existing /etc/network/interfaces file.

### The Solution

Comment out all but the following from your /etc/network/interfaces:

%RAW%
<pre>
auto lo
iface lo inet loopback
</pre>
%RAW%

Add the user to the netdev group:

%RAW%
<pre>
$ sudo adduser your_username netdev
</pre>
%RAW%