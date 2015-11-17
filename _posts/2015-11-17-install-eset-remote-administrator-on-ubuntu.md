--- 
layout: post 
title: Howto | Install ESET Remote Administrator on Ubuntu
date: 2015-11-17 20:12:00
type: post 
category: technology
tags: [linux, ubuntu, howto, eset]
image: eset-remote-administrator.png
---

After much research I decided to purchase [ESET Antivirus] for our Windows clients. 
But rather than install ESET Antivirus on each client in turn, I decided to install ESET Remote Administrator on an Ubuntu VPS.
ESET Remote Administrator is a server program for controlling ESET Antivirus (and other ESET programs) on clients, you can use it to deploy the ESET Agent, which in turn can then install and monitor the ESET Antivirus software.

<!--more-->

Our Windows PCs are controlled by an ActiveDirectory server (actually a [Samba]4 ActiveDirectory server, although that should not make any difference to these instructions).

I found [ESET instructions] for so doing decidedly sketchy, but I eventually managed to install it and took some notes as I went. 
I cannot promise these instructions are complete, but used in conjunction with the [ESET instructions] they may be of help.


Update Hosts
------------

Edit `/etc/hosts`:

    127.0.0.1       localhost.example.lan      localhost.localdomain        localhost
    192.168.0.109   eset.example.lan           eset


Test by typing the following two commands and checking the output matches:

    # hostname
    eset

    # hostname -f
    eset.example.lan


Dependencies
------------

    # apt-get install mysql-server unixodbc libmyodbc cifs-utils libjcifs-java winbind libqtwebkit4 xvfb
    # dpkg-reconfigure libmyodbc 


Install MySQL Server
--------------------

Edit `/etc/mysql/my.cnf`:

    max_allowed_packet=33M
    
Restart MySQL

    # service mysql-server restart


Configure MySQL
---------------

    # mysql -u root -p

Cannot remember whether I created database and/or username and password, suggest you try without and then with.


Install ESET Remote Administration Server
-----------------------------------------

Replace ??? with actual:

    # sh Server-Linux-x86_64.sh --license-key=??? \
    --db-type="MySQL Server" --db-driver="MySQL" --db-hostname=127.0.0.1 --db-port=3306 \
    --server-root-password="???" --db-name="era_db" --db-admin-username="root" --db-admin-password="???" \
    --db-user-username="era" --db-user-password="???" \
    --cert-hostname="eset" --cert-auth-common-name="eset.example.lan" --cert-organizational-unit="eset.example.lan" \
    --cert-organization="example ltd" --cert-locality="UK" \
    --ad-server="ads.example.lan" --ad-user-name="era" --ad-user-password="???"

In case of error, read the following carefully:

    /var/log/eset/RemoteAdministrator/EraServerInstaller.log


Install Tomcat7
---------------

    # apt-get install tomcat7 tomcat7-admin

Wait 5 minutes for Tomcat to start, then visit http://localhost:8080 to check it has worked.


Configure SSL
-------------

See [SSL/TLS Configuration HOW-TO](https://tomcat.apache.org/tomcat-7.0-doc/ssl-howto.html#Configuration).

### Step 1 - Generate Keystore

    $JAVA_HOME/bin/keytool -genkey -alias tomcat -keyalg RSA -keystore /usr/share/tomcat7/.keystore

Use password 'changeit'.

At the time of writing $JAVA_HOME is `/usr/lib/jvm/java-7-openjdk-amd64/jre`

### Step 2 - Configure Tomcat

You should have two sections like this:

    <Connector port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               URIEncoding="UTF-8"
               redirectPort="8443" />

    <Connector port="8443" protocol="HTTP/1.1" SSLEnabled="true"
               maxThreads="150" scheme="https" secure="true"
               keystoreFile="/usr/share/tomcat7/.keystore" keystorePass="changeit"
               clientAuth="false" sslProtocol="TLS" />

These will already exist, but need uncommenting and adjusting with keystore details.

### Test

You should now be able to go to <http://localhost:8443>.


Join Windows Domain
-------------------

The ERA server must be joined to the domain

Install samba and stop any samba services that start.

    # apt-get install samba krb5-user smbclient

Edit `/etc/samba/smb.conf`:

    [global]
             workgroup = EXAMPLE
             security = ADS
             realm = EXAMPLE.COM
             dedicated keytab file = /etc/krb5.keytab
             kerberos method = secrets and keytab
             server string = Samba 4 Client %h
             winbind enum users = yes
             winbind enum groups = yes
             winbind use default domain = yes
             winbind expand groups = 4
             winbind nss info = rfc2307
             winbind refresh tickets = Yes
             winbind normalize names = Yes
             idmap config * : backend = tdb
             idmap config * : range = 2000-9999
             idmap config EXAMPLE : backend  = ad
             idmap config EXAMPLE : range = 10000-999999
             idmap config EXAMPLE:schema_mode = rfc2307
             printcap name = cups
             cups options = raw
             usershare allow guests = yes
             domain master = no
             local master = no
             preferred master = no
             os level = 20
             map to guest = bad user
             username map = /etc/samba/smbmap

Create `/etc/samba/smbmap`:

    !root = EXAMPLE\Administrator Administrator admionistrator

Edit `/etc/krb5.conf`:

    [libdefaults]
          default_realm = EXAMPLE.COM
          dns_lookup_realm = false
          dns_lookup_kdc = true
          ticket_lifetime = 24h
          forwardable = yes

Make sure that `/etc/resolv.conf` points to the AD DC, and dns is setup correctly.

Then run this command:

    # net ads join -U Administrator@EXAMPLE.COM

Enter Administrators password when requested.

Edit `/etc/nsswitch.conf` and add 'winbind' to passwd & group lines.

Start samba services.


Update DNS
----------

For some reason the join does not always create the DNS entry on Samba4, so you may need to add this manually.


References
----------

 * [Samba]
 * [ESET Remote Administrator Installation Instructions][eset instructions]
 * [Troubleshoot Linux Installation][troubleshoot]

[eset antivirus]: http://www.eset.co.uk/Business/Endpoint-Security/Endpoint-Antivirus
[samba]: https://www.samba.org/
[troubleshoot]: http://support.eset.com/kb3728/
[eset instructions]: http://help.eset.com/era_install/62/en-US/index.html?linux.htm
