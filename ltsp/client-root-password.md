---
layout: page
title: "LTSP | LTSP5 Client Root Password"
menu: ltsp
weight: 10
---

## LTSP Client Root Password

### Introduction

Most GNU/Linux machines have 12 virtual consoles, which you can access by pressing Control-Alt-F1, through Control-Alt-F12. There is a text based getty that is started on screen 1, but you normally can't log into it, as there are no local users on the thin client.

### Setting the root password for client

However, for debugging purposes, you may want to set up root to log in on the thin client. You may need to do this if you're debugging problems with local devices, for example. Fortunately, it's easy to do: on the server, just chroot into the LTSP chroot, and set the password with passwd.

    $ sudo chroot /opt/ltsp/i386
    # passwd
    # exit
    $ sudo ltsp-update-image

### Logging in

Just enter Ctrl-Alt-F1 on your terminal, and at the text login, login with "root" and the password you have set.
