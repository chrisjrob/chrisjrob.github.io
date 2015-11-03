---
layout: page
title: "LTSP | Install X11VNC on LTSP5"
menu: ltsp
weight: 16
category: technology
tags: [ltsp]
---

## Install x11vnc on LTSP5

### Warning

This is how I installed x11vnc on our Debian Lenny LTSP5 server, these are my notes, nothing more.  Use at your peril.

### Installing x11vnc

Enter the chroot

    $ sudo chroot /opt/ltsp/i386

And update the repositories that the ltsp environment uses for apt-get:

    # apt-get update
    # apt-get install x11vnc

### Create start-up script

Still in the chroot, edit `/etc/init.d/x11vnc` and copy in the following script:

    #!/bin/sh

    ### BEGIN INIT INFO
    # Provides:x11vnc
    # Required-Start:$remote_fs $syslog
    # Required-Stop:$remote_fs $syslog
    # Default-Start:2 3 4 5
    # Default-Stop:0 1 6
    # Short-Description:Start X11VNC
    # Description:Start VNC server X11VNC at boot
    ### END INIT INFO

    case "$1" in
            start) 
                    sleep 6
                    XAUTH=`find /var/run/ldm-xauth* -type f`
                    logger -f /var/log/x11vnc "Starting with $XAUTH"
                    start-stop-daemon --start --oknodo --pidfile /var/run/x11vnc.pid --background --nicelevel 15 --make-pidfile --exec /usr/bin/x11vnc -- -display :7 -loop -passwdfile /etc/x11vncpassword -nossl -logfile /var/log/x11vnc -auth $XAUTH
            ;;
            stop)  
                    logger -f /var/log/x11vnc "Stopping"
                    start-stop-daemon --stop --oknodo --pidfile /var/run/x11vnc.pid
            ;;
            restart)
                    logger -f /var/log/x11vnc "Restarting"
                    $0 stop
                    $0 start
            ;;
            condrestart)
                    PID=`cat /var/run/x11vnc.pid`
                    RUNNING=`ps h --ppid $PID`
                    if [ "$RUNNING" == "" ]; then
                            logger -f /var/log/x11vnc "No process matching /var/run/x11vnc.pid"
                            echo "No process matching /var/run/x11vnc.pid"
                            $0 restart
                    else   
                            logger -f /var/log/x11vnc "Process matching /var/run/x11vnc.pid exists"
                            echo "Process matching /var/run/x11vnc.pid exists - no action taken"
                    fi
            ;;
            *)
                    echo "Usage: $0 start|stop|restart|condrestart"
                    exit 1
            ;;
    esac

    exit 0

### Finalise start-up script

Still in the chroot, make the script executable and link it into /etc/rc2.d:

    # chmod 755 /etc/init.d/x11vnc
    # update-rc.d x11vnc defaults
    # ls -al /etc/rc2.d/*x11vnc

### Set x11vnc password

Finally, create the /etc/x11vncpassword file with the password you want to use to connect to your thin clients:

    # echo "thepassword" > /etc/x11vncpassword
    # chmod 400 /etc/x11vncpassword
    # chown root:root /etc/x11vncpassword

**Replace "thepassword" with your chosen password.**

### Alternative Method

The issue with the above method is that if you user does not reboot their client after logging off, then x11vnc does not restart.  An alternative, remove the above symlink from `/etc/rc2.d/S99x11vnc` and instead use an ldm start up script by adding the following two scripts:

    # /opt/ltsp/i386/usr/share/ldm/rc.d/I99-x11vnc
    # LDM Script to start x11vnc

    XAUTH=`find /var/run/ldm-xauth* -type f`
    start-stop-daemon --start --oknodo --pidfile /var/run/x11vnc.pid --background --nicelevel 15 --make-pidfile --exec /usr/bin/x11vnc -- -display :7 -loop -passwdfile /etc/x11vncpassword -nossl -logfile /var/log/x11vnc -auth $XAUTH

The "I" in I99-x11vnc denotes that this will be run after X and before LDM, which is perfect for VNC.

    # /opt/ltsp/i386/usr/share/ldm/rc.d/X99-x11vnc
    # LDM Script to stop x11vnc

    start-stop-daemon --stop --oknodo --pidfile /var/run/x11vnc.pid

The "X" denotes that this script will be run upon logout, so this is closing down the x11vnc server, ready to restart with LDM.

This method will still not cope with X being terminated with ctrl+alt+backspace, in which scenario you can ssh onto the client and run `/etc/init.d/x11vnc condrestart` - you could also add this in as a local app to be accessible from the server desktop.

### References

   * https://wiki.edubuntu.org/InstallX11VncOnLtspClients

