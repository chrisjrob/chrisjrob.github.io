---
layout: post
title: Howto | Install Adempiere on Debian Lenny
menu: howto
date: 2010-02-22 17:28:11
weight: 40
category: technology
tags: [linux, debian, adempiere]
---

I have run through these notes again and corrected the odd mistake and they do seem to work.  At least until something changes!!

I have not yet got the init.d script working, but am able to successfully start adempiere and reach the login page.

I need to review the postgresql security settings as "trust" for all is probably unsafe.

<!--more-->

Lastly, I am an adempiere newbie, so please take everything I say with a pinch of salt.

Good luck!


## Install a Debian system

Please visit Debian for guidance on how to do this.  Personally I like to install an absolutely bare system as my starting point (I even uncheck the option for "standard system").

It is possible, I believe, to do a headless (non-GUI) installation, but these instructions do require a desktop environment, as some of the setup screens require a GUI.  

For example to install a minimal KDE on a Debian base system:

    # apt-get install kdm kde-core


## Install tofrodos

Required for the database migration.

    # apt-get install tofrodos


## Install Postgresql > 8.2

Fortunately Debian includes version 8.3, so a simple apt-get should do the trick:

    # apt-get install postgresql postgresql-doc oidentd

And a ton of dependencies will also be installed.

Once installed, you should have a functional postgresql database installed and running.  Debian places the database in `/var/lib/postgresql/version` the default database is named `main` and is located in `/var/lib/postgresql/version/main`. We assume in this guide that Adempiere's database will be created in the default cluster.


## Install Java

sun-java6 is the version to install, unless you are using the ajax interface in which case you can even use openjdk. To do add `contrib non-free` to `/etc/apt/sources.list` repositories.

    # apt-get install sun-java6-jdk sun-java6-fonts sun-java6-jre sun-java6-plugin


## Configure postgresql for java

Now we must add the `JAVA_HOME` variable to the `/etc/postgresql/8.3/main/environment` so postgresql can find the java virtual machine:

    JAVA_HOME = '/usr/lib/jvm/java-6-sun'


## Authorise users for postgres

Now we must enable users to access the database as the postgres user, which is the system user of the database and will be used by the `RUN_ImportAdempiere.sh` script to import the database data.

Add the following lines to `/etc/postgresql/8.3/main/pg_hba.conf`:

**You may wish to change the IP address to the external IP**

    # Database administrative login by UNIX sockets
    #local   all         postgres                          ident sameuser

    # TYPE  DATABASE    USER        CIDR-ADDRESS          METHOD

    # "local" is for Unix domain socket connections only
    local   all         all                                 trust

    # IPv4 local connections for user postgres:
    host    all         postgres       127.0.0.1/32         trust
    # IPv4 local connections for user adempiere:
    host    all         all            127.0.0.1/32         trust
    # IPv6 local connections:
    host    all         all            ::1/128              trust

**trust or md5 - trust is probably wrong**


## Configure postgresql listen address

Running the database configured in localhost isn't probably what you want, as all the clients will need access to this database and the address you tell the script the database runs from will be remembered in the future (but it can be altered). So you should probably put you server external IP address (the address of the eth0 interface i.e.) instead of the 127.0.0.1 address of the previous line.

If this is a test server and you will only be accessing it locally, then leaving it as 127.0.0.1 is fine.


## Restart Postgresql

We must now restart the postgresql server to active the changes in the configuration files:

    # /etc/init.d/postgresql-8.3 restart


## Install Subversion

    # apt-get install subversion


## Download Adempiere from SVN Head

**This could take a very long time, depending on your Internet bandwidth**

    $ svn co https://adempiere.svn.sourceforge.net/svnroot/adempiere/trunk */svnworkdir/adempiere


## Build Adempiere

Open a terminal window.

    $ export JAVA_HOME='/usr/lib/jvm/java-6-sun'
    $ cd */svnworkdir/adempiere/utils_dev
    $ ./RUN_build.sh


## Install Adempiere

    # unzip */svnworkdir/adempiere/install/build/Adempiere_354a.zip -d /opt

Now the extracted folder `/opt/Adempiere` exists in `/opt`:

    $ cd /opt
    $ sudo mv Adempiere adempiere-3.54a
    $ sudo ln -sf adempiere-3.54a adempiere

Now it looks like this:

    $ ls -l /opt
    $ total 4
    $ lrwxrwxrwx  1 root root   15 Oct 18 19:22 adempiere -> adempiere-3.54a
    $ drwxr-xr-x 10 root root 4096 Oct 18 19:11 adempiere-3.54a


## Create the database

Switch to the postgres user:

    debian:/opt$ sudo su - postgres
    postgres@debian:*$ export ADEMPIERE_HOME="/opt/adempiere"
    postgres@debian:*$ /usr/bin/createdb adempiere
    postgres@debian:*$ /usr/bin/createuser adempiere
    Shall the new role be a superuser? (y/n) y


## Set database password

    postgres@debian:*$ echo "ALTER USER adempiere WITH PASSWORD 'your-chosen-password';" | psql
    ALTER ROLE


## Check database

    postgres@debian:*$ echo "select * from pg_user; select * from pg_roles;" | psql
      usename  | usesysid | usecreatedb | usesuper | usecatupd |  passwd  | valuntil | useconfig
    -----------+----------+-------------+----------+-----------+----------+----------+-----------
     postgres  |       10 | t           | t        | t         | ******** |          |
     adempiere |    16385 | t           | t        | t         | ******** |          |
    (2 rows)

      rolname  | rolsuper | rolinherit | rolcreaterole | rolcreatedb | rolcatupdate | rolcanlogin | rolconnlimit | rolpassword | rolvaliduntil | rolconfig |  oid
    -----------+----------+------------+---------------+-------------+--------------+-------------+--------------+-------------+---------------+-----------+-------
     postgres  | t        | t          | t             | t           | t            | t           |           -1 | ********    |               |           |    10
     adempiere | t        | t          | t             | t           | t            | t           |           -1 | ********    |               |           | 16385
    (2 rows)
    postgres@debian:*$ exit


## Load database

    $ export ADEMPIERE_HOME="/opt/adempiere"
    $ psql -h localhost -d adempiere -U adempiere < $ADEMPIERE_HOME/data/Adempiere_pg.dmp


## Set-up Adempiere

    $ export ADEMPIERE_HOME="/opt/adempiere"
    $ cd $ADEMPIERE_HOME
    $ sudo chmod +x *.sh
    $ export JAVA_HOME='/usr/lib/jvm/java-6-sun'
    $ sudo ./RUN_setup.sh

Please note that this section must be able to write to the display, so either the desktop session needs to be root, or use sudo.  If you get an error about connecting to DISPLAY then try using sudo.

The following screen should now be displayed.  Change the database name to adempiere, database type to postgresql, set your mailserver settings.  You may need to set the database server to localhost, if the hostname does not work.

<img src="/assets/adempiere_server_setup.png">


## Migrate to Head

    $ cd */svnworkdir/adempiere/migration
    $ chmod +x *.sh
    $ ./migrate_postgresql.sh 354a-trunk commit | psql -U adempiere -d adempiere > 354a-trunk.lst
    NOTICE:  ALTER TABLE / ADD PRIMARY KEY will create implicit index "ad_document_action_access_key" for table "ad_document_action_access"
    NOTICE:  ALTER TABLE / ADD PRIMARY KEY will create implicit index "r_contactinterest_key" for table "r_contactinterest"
    NOTICE:  CREATE TABLE / PRIMARY KEY will create implicit index "c_ordersource_pkey" for table "c_ordersource"
    NOTICE:  CREATE TABLE / UNIQUE will create implicit index "c_ordersource_ad_client_id_key" for table "c_ordersource"
    WARNING:  there is no transaction in progress


## Start Server

    $ cd $ADEMPIERE_HOME/utils
    $ sudo nohup ./RUN_Server2.sh &
    $ sudo tail -f nohup.out

**The output of nohub.out will indicate that the server started in only a few seconds, this is only the JBoss server, the site will not be accessible for several minutes.**


## Client Login

On the server, open a browser and go to: http://hostname.yourdomain/admin/ and follow the Adempiere ZK Webui

**http://localhost/admin/ will not work.**

| Usage                                 | User        | Password    |
|---------------------------------------+-------------+-------------|
| System Management                     | System      | System      |
| System Management or any role/company | SuperUser   | System      |
| Sample Client Administration          | GardenAdmin | GardenAdmin |
| Sample Client User                    | GardenUser  | GardenUser  |

For guidance visit <http://www.adempiere.com/index.php/InstallClient>.


## Optional: Install init.d script

Not essential for a test server (and I have not yet got this working, I suspect because I am not using user = adempiere.

```sh
# ./RUN_Server2Stop.sh
# sudo cp unix/adempiere_Debian.sh /etc/init.d/adempiere
# /etc/init.d/adempiere start 
```


## Read the Functional User Manual

   * http://www.adempiere.com/index.php/Functional_User_Manual


## References

   * http://www.adempiere.com/index.php/Debian_and_PostgreSQL_Install
   * http://www.adempiere.com/index.php/Adempiere/Libero_Linux_install_from_subversion_head
   * http://www.adempiere.com/index.php/Manual_Installation_From_Trunk
   * http://www.adempiere.com/index.php/ADempiere_Install_Linux&PostgreSQL
   * http://www.adempiere.com/index.php/ADempiere_Install#JDBC_Connection_Error
      * http://www.adempiere.com/index.php/CreateDatabase
      * http://www.adempiere.com/index.php/InstallComplete
   * http://www.adempiere.com/index.php/ADempiere_with_Postgresql_on_Ubuntu_9.04_Jaunty

