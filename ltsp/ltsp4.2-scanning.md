---
layout: page
title: "LTSP | LTSP4.2 Scanning"
menu: ltsp
weight: 10
category: technology
tags: [ltsp]
---

## LTSP4.2 Scanning

### References

   * http://wiki.ltsp.org/twiki/bin/view/Ltsp/Scanners

### Enable saned on terminal

   * Edit `/opt/ltsp/i386/etc/lts.conf` and add `XINETD_SERVICES = "saned"` to the `[default]` or relevant terminal section
   * Restart the terminal
   * Run `scanimage -L` on workstation shell to verify that scanner has been detected

### Usage

   * Physically plug the scanner into the terminal using USB or parallel port.
   * Edit `/etc/sane.d/net.conf` and add the hostname or address of client running saned
   * Use xsane, OpenOffice.org, GIMP, or any other scanner-aware application, as they should now list the scanner.

### Alternative to net.conf

If you do not wish to add the host to net.conf (as shown above) then you can run the following:

    $ SANE_NET_HOSTS=`echo $DISPLAY | cut -d: -f1`
    $ export SANE_NET_HOSTS

**This will only work for the life of the terminal window - so you will need to run the application from the command line. Alternatively add this to a script that does the scanning.**

### Scanning from the command line

#### Check scanner detected

    $ scanimage -L

#### Scan

    $ scanimage -l 0 -t 0 -x 215 -y 297 --mode {Lineart|Gray|Color} --resolution {75..600} --format {pnm|tiff} --brightness {-100..100} --contrast {-100..100} >test.pnm
