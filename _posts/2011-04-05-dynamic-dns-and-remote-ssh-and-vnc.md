--- 
layout: post 
title: Dynamic Dns and Remote ssh and VNC
date: 2011-04-05
type: post 
published: true 
status: publish
categories: technology linux
tags: vnc ssh dyndns
---

I want to be able to support my father's PC remotely via SSH and VNC.
Some people recommend teamviewer, but I prefer the flexibility and
security of ssh, and the fact that this approach is fully open source.

Step 1: Sign up for Dynamic DNS
-------------------------------

<!--more-->

The first problem is that most people's Internet service do not have a
static IP address. In practice it is fairly static on modern broadband
services, but, if you do not want to be fiddling about trying to find
out what the current IP address is, then you need a dynamic DNS
service.

Dynamic DNS gives you an unchanging address which is automatically
mapped to the current IP address, whatever that might be. So for example
you might have `daddy.dyndns.xyz` as your address. To make this work,
you need to have a client machine on the network, that will keep
updating daddy.dyndns.xyz with the latest IP address. Some home routers
have this functionality built in.

I did some research and determined that the very popular
<http://dyndns.com> service is reliable, and so I went ahead and signed
up a new account for my father, and set-up a hostname for his router's
WAN address.

Step 2: Configure Client
------------------------

If you're lucky your router will support dynamic DNS. My father's did,
so I just logged onto the router and entered the dyndns account
information, and it just worked perfectly.

If your router does not support dynamic DNS, all is not lost, simply
install ddclient on a computer on the network (presumably, but not
necessarily, the one that you want to be supporting):

    $ sudo apt-get install ddclient`

Configuration of ddclient is simple, the ncurses configuration process
takes you step-by-step through the necessary steps.

Step 3: Configure port forwarding
---------------------------------

The next problem is that your router has a firewall that is designed
explicitly to stop people getting into your network. We need to punch a
small hole in that firewall. Needless to say this does have security
implications, so we need to be careful.

So we need to open a port on the router and forward it to the machine
that we wish to support. This machine does need to have a static IP
address.

Log onto your router via its web management page. The main difficulty
here is in finding the port forwarding option, when it is probably
called something user friendly like Game Sharing or some other
perversely unhelpful name. If you can't find it, then you're best of
Googling for "port forwarding routername" where routername is the make
and model of your router. Or just read the manual, if by some miracle
you have one to hand.

But which port to forward? Your router will probably make it easy to
forward the standard ssh port - port 22 - the problem is that everyone
knows that is the ssh port and you may experience a high number of
attacks on that port. In theory you should be safe enough with secure
passwords, but personally I would not choose to forward the standard ssh
port, but would instead add a custom service "ssh\_obscure" on a
different TCP port number and forward that to port 22 on PC that you
wish to support:

    Name: ssh_obscure
    Protocol: TCP
    Source port: 2121 (or whatever you choose)
    Destination IP: (enter the client PC's IP)
    Destination Port: 22

If it won't let you specify a Destination Port, then it will forward to
the same custom port on the PC. This will then require a change in the
configuration of sshd on the PC, which I will explain in the next step.

Step 4: Install openssh-server
------------------------------

On the client PC, i.e. the PC you will be supporting, install
openssh-server and its dependencies:

    $ sudo apt-get install openssh-server

If you didn't bother with the ssh_obscure suggestion above, then you
are simply forwarding from port 22 on the router to port 22 on the
client and no further configuration of openssh is required.

If you did set-up the ssh_obscure, but forwarding to port 22 on the
client, then again no further configuration is required.

If you set up ssh_obscure, but were unable to set a Destination Port,
then you are forwarding the same port to the client, so you will need to
change the relevant setting in `/etc/ssh/sshd_config`. E.g. `Port 2121`.
Then reload the ssh configuration with:

    $ sudo /etc/init.d/ssh force-reload

Step 5: Install Fail2ban
------------------------

As stated above, we have reduced the security of your network by taking
these steps and we are now going to attempt to rectify this somewhat by
installing fail2ban.

Some argue that this is unnecessary, if you have set a custom port for
ssh and maintain secure passwords, but I see no reason for relying on
security by obscurity. The main benefit of using a custom ssh port is to
prevent the attempts in the first place, but **hiding your front door is
no substitute for locking it**.

Fail2ban will monitor your `/var/log/auth.log` and block any hosts that
have repeatedly failed to login correctly, by blocking them in iptables
(the standard Linux firewall).

    $ sudo apt-get install fail2ban

Next you should create a new file `/etc/fail2ban/jail.local`, with the
following contents:\

    [ssh]
    enabled = true
    port = ssh
    filter = sshd
    logpath = /var/log/auth.log
    maxretry = 3
    bantime = 600

Strictly speaking the above is already configured in
`/etc/fail2ban/jail.conf`, but I think it makes sense to take ownership
of those settings by redefining them in jail.local. If you have set a
custom ssh port, then set it in jail.local as above, replacing 
`port = ssh` with `port = 2121` or whatever. I have reduced maxretry to 3 from
the default of 6, as I found it was giving nearer to 18 attempts, thanks
to the peculiarities of the auth.log file.

Finally reload these new settings in fail2ban:

    $ sudo /etc/init.d/fail2ban force-reload

In order to test fail2ban, try and log into the client from another
machine on the same network. You will need attempt to log in with the
wrong password a number of times. This may not be exactly 3 times, but
if you get to 9 attempts and it still has not blocked you, then there is
problem.

fail2ban will only block you for 10 minutes, after 3 failed login
attempts (you can change these settings as above).

Step 6: Testing SSH
-------------------

At this stage you should be able to log in remotely to your client PC.

    $ ssh -p 2121 username@daddy.dyndns.xyz

Obviously change 2121 for your custom port, or leave out `-p 2121` if
you are using the standard ssh port 22.

Step 7: Installing VNC
----------------------

Having ssh access is wonderful, but not much help when your Dad asks you
where his OpenOffice toolbar has gone; so we need to add VNC on the PC
you wish to support:

    $ sudo apt-get install x11vnc

And on the PC from which you will be providing support you need to
install vnc-viewer, or use your preferred vncviewer:

    $ sudo apt-get install xvnc4viewer

Step 8: Testing VNC
-------------------

Now, you *could* have set up x11vnc to be running permanently with a
password, and then you could set your router to port forward a custom
VNC port to the client PC. This approach does significantly degrade your
security and is in any case unnecessary. Instead we can just run it when
we need it by using ssh, by typing this command **from the PC from which
you will be providing support** and changing as appropriate:

    $ ssh -p 2121 -t -L 5900:localhost:5900 username@daddy.dyndns.xyz 'x11vnc -noxdamage -localhost -display :0'

This will connect by ssh to the client machine, run x11vnc bound only to
localhost (so no-one else can connect to it) and build a tunnel between
the remote VNC port to your local VNC port.

One caveat is that the username needs to be the currently logged in
user, otherwise x11vnc will refuse to start.

And finally on the PC from which you are providing support we just run:

    vncviewer localhost:0

And you should now be looking at your father's (or whoever's) PC.

Whilst this does all sound pretty involved, all but this final step is
only required once, then a quick ssh command and vncviewer and you are
connected.

