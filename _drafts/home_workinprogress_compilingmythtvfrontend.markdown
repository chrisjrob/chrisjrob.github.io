## Compiling MythTV Frontend

### Compiling

%RAW%
<pre>
$ svn co http://svn.mythtv.org/svn/branches/release-0-23-fixes/mythtv
$ cd mythtv
$ ./configure --prefix=/usr/local --disable-backend
$ make
$ sudo checkinstall (correct package name and version number)
$ sudo ldconfig
</pre>
%RAW%

### Running

Make sure that the mythtv-backend and mysql-server is running on the external IP address, rather than 127.0.0.1 or localhost.

Set a PIN number on the backend set-up.

%RAW%
<pre>
$ /usr/local/bin/mythfrontend
</pre>
%RAW%
