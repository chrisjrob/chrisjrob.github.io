## Install Printing

<<<---
%TOC%
<<<---

### Warning

<!> This document is certainly incomplete and possible inaccurate.

### Install Cups Print System

This also installs printer libraries, printing for GIMP, additional fonts etc.

<pre>
$ sudo apt-get install cupsys cupsys-client cupsys-bsd cupsys-driver-gimpprint cups-pdf cupsys-pt cupsys-driver-gutenprint libgutenprint2
$ sudo apt-get install gutenprint-doc gutenprint-locales foomatic-db-gutenprint
$ sudo apt-get install foomatic-db-engine foomatic-db foomatic-db-hpijs foomatic-filters foomatic-filters-ppds
$ sudo apt-get install hplip hplip-doc hp-ppd hpijs hpijs-ppds hplip-data python-qt3 python-sip4
$ sudo apt-get install psfontmgr ttf-kochi-mincho ttf-arphic-bkai00mp ttf-arphic-bsmi00lp ttf-arphic-gbsn00lp ttf-arphic-gkai00mp ttf-baekmuk 
$ sudo apt-get install gs-cjk-resource xpp linuxprinting.org-ppds 
</pre>

### Wine Printing

See http://frankscorner.org.

Another way to print in Wine:
Steps:
   * regedit
   * in HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Printers\~cups_printer_name~
   * find the key "Port"
   * change it's value to "|kprinter" for kde

When the user wants to print, the standar print dialog appears.



