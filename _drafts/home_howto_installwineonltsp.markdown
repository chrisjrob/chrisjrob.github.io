## Install Wine on LTSP

<<<---
%TOC%
<<<---

### Warning

<!> These instructions have not been tested since re-writing, in particular there will be permissions issues.

### Step 1: Install Wine

Please visit for instructions on how to install Wine:

   * http://www.winehq.org/site/download

<?> If you get a problem with applications appearing without any text, then simply download and install some Windows fonts in Wine, e.g. from http://sourceforge.net/projects/corefonts/

<pre>
$ sudo apt-get install libwine libwine-print libwine-sane libwine-alsa
</pre>

Your requirements may vary, a non-inclusive list of available libraries is:

   * libwine: the core wine library
   * libwine-print: the printing library
   * libwine-sane: the scanning library
   * libwine-alsa: the alsa sound library
   * libwine-oss: the oss sound library

You will notice winetools mentioned on several websites, my understanding is that this is no longer supported.

### Step 2: Create a Wine directory for your application

By default Windows applications are installed in /home/user/.wine. If you want to install your application in a different directory then you must use the WINEPREFIX variable.

If you want your application to be installed in /usr/local/share/appname you must first create the directory:

%RAW%
<pre>
$ cd /usr/local/share
$ mkdir appname
$ WINEPREFIX="/usr/local/share/appname" wineprefixcreate
</pre>
%RAW%

In this directory you will now find a fake Windows drive and the Wine configuration files system.reg and user.reg.

### Step 3: Configure your Wine directory

<?> You can probably skip this step for typical installations.

%RAW%
<pre>
$ WINEPREFIX="/usr/local/share/appname" winecfg
</pre>
%RAW%

### Step 4: Install your application

>>>----------------------
##### Installing from an .msi file
 
You can install .msi files with the msiexec.exe utility. This command is built into Wine, so you don't have to install Windows Installer from Microsoft.
If the .msi file is called msifile.msi you just have to type msiexec /i msifile.msi and the application will be installed.
 
<!> Make sure you're not using a native version of msi.dll, but the builtin one.
>>>----------------------

To run the Windows install program, please type the following:

%RAW%
<pre>
$ WINEPREFIX="/usr/local/share/appname" wine /path/to/setup.exe
</pre>
%RAW%

<?> Substitute "/path/to/setup.exe" with the installation path executable for your application

### Step 5: Test your application

%RAW%
<pre>
$ WINEPREFIX="/usr/local/share/appname" wine "drive_c/Program Files/app/appname.exe"
</pre>
%RAW%

### Step 6: Configure for multi-user operation

<!> This section needs a re-write (or just refer to Example automation script below)

It is possible to configure the system so that a system Wine installation (and applications) can be shared by all the users, and still let the users all have their own personalized configuration.

   # Creating individual user directory, e.g. /home/username/.appname
   # Symlink directory structure to /usr/local/share/appname
   # Remove symlink for user.reg (will be auto-created for each user on first run)

%RAW%
<pre>
$ ln -sf /usr/local/share/appname/system.reg system.reg
</pre>
%RAW%

To assist in this process, please refer to the following guide:

   * http://www.winehq.org/site/docs/wineusr-guide/using-regedit

and perhaps even symlink these back to the administrator's account, to make it easier to install apps system-wide later:


You might be tempted to do the same for user.reg as well, however that file contains user specific settings. Every user should have their own copy of that file along with the permissions to modify it.

You'll want to pay attention to drive mappings. If you're sharing the system.reg file you'll want to make sure the registry settings are compatible with the drive mappings in ~/.wine/dosdevices of each individual user. As a general rule of thumb, the closer you keep your drive mappings to the default configuration provided by wineprefixcreate, the easier this will be to manage. You may or may not be able to share some or all of the actual "c:" drive you originally installed the application to. Some applications require the ability to write specific settings to the drive, especially those designed for Windows 95/98/ME.


#### Example automation script

This script was probably cobbled together from the superb ies4linux installation, or possibly from Franks Corner, 

%RAW%
<pre>
#!/usr/bin/perl
# Launch script for multiuser appname, master copy in /usr/local/share/appname.

use strict;

my $MASTERPREFIX = '/usr/local/share/appname';
my $WINEPREFIX   = $ENV{'HOME'} . '/.appname';

use vars qw($MASTERPREFIX $WINEPREFIX);

# If we're not set up, create the user's magic symlink-copy of the master
# installation.

unless (-d "$WINEPREFIX") {
	system('mkdir', '-p', "$WINEPREFIX") == 0 || die "mkdir -p $WINEPREFIX: $?";
	system('lndir', "$MASTERPREFIX", "$WINEPREFIX") == 0 || die "lndir failed: is xutils installed? $?";

	# The profile directory will be recreated automatically by wine on the
	# first run, so it's OK to blow away eny existing copy hanging around in
	# unwritable symlink form from the install, and it's OK to just create a
	# blank one.
   
	$PROFILES = $WINEPREFIX . '/drive_c/windows/profiles';
	system('rm', '-fr', "$PROFILES") == 0 || die "rm -fr $PROFILES failed: $?";
	system('mkdir', '-p', "$PROFILES") == 0 || die "mkdir -p $PROFILES failed: $?";

	# WINE needs to be able to write to the following files, so they can't be
	# symlinks to root-owned ones.
   
	foreach my $file ('.no_prelaunch_window_flag', 'system.reg', 'userdef.reg', 'user.reg') {
		if (-l $WINEPREFIX . '/' . $file) {
			system('rm', '-f', $WINEPREFIX . '/' . $file) == 0 || die "rm -f $WINEPREFIX/$file failed: $?";
			system('cp', $MASTERPREFIX . '/' . $file, $WINEPREFIX . '/' . $file) == 0 || die "Cannot copy $MASTERPREFIX/$file to $WINEPREFIX/$file: $?";
		}
	}
	system('chmod', '-R', 'og-rwx', $WINEPREFIX) == 0 || die "Cannot chmod -R og-rwx $WINEPREFIX: $?";

}

exec('env', 'WINEPREFIX=' . $WINEPREFIX, 'wine', $WINEPREFIX . '/drive_c/Program Files/appname/appname.exe', @ARGV) == 0 || die "Failed to launch appname: $?\n";

exit;
</pre>
%RAW%

### References

   * {WineHQ|http://www.winehq.org/}
      * {Wine Mailing List|http://www.winehq.org/mailman/listinfo/wine-users}
   * {LTSP|http://www.ltsp.org/}
      * {LTSP Mailing List|http://marc.info/?l=ltsp-discuss&r=1&w=2}
   * {IES4Linux|http://www.tatanka.com.br/}
   * Franks Corner|http://frankscorner.org/}
   * Wine printing problems:
      * http://www.la-sorciere.de/Wine-HOWTO/wineprintconfig.html
      * http://groups.google.com/group/comp.emulators.ms-windows.wine/msg/b05da7237281dbab
