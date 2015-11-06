## Install Scanning in Wine

Ensure you install the same version as wine.  For me that meant installing as follows:

<pre>
$ sudo apt-get install -t 'etch-backports' libwine-sane
</pre>

This worked to a fashion for me; in that it brought up a rather poor scanner dialog, and triggered the scanner, but never completed the scan job.  That said, I was using saned on LTSP (i.e. via network) which may be a step too far for libwine-sane!

