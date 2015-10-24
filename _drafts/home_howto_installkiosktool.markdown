## Install Kiosktool

<<<---
%TOC%
<<<---

### Introduction

First let's take a look at where KDE squirrels away all these settings. KDE is complex, but it's well-organised, and there is always a method to whatever KDE madness you find yourself in.

   * */etc/kderc* :  This points to the file locations where configuration profiles are stored. 
   * */etc/kde3* : Global configuration files are here. 
   * */home/~username~/.kde* : User's individual settings go here.

You can see for yourself where your particular KDE installation is going to look for configuration files: 

<pre>
$ kde-config --path config
/home/carla/.kde/share/config/:/etc/kde3/:/usr/share/kubuntu-
default-settings/kde-profile/default/share/config/
</pre>
  
KDE reads these in reverse order, so if it encounters any conflicts, the last value read is the one used. User's individual configurations take precedence, so they are read last. 
There is a way to make an exception to the precedence rule: using $i, or the "immutable" key. You'll see how this is used in the examples below. Anything marked immutable has precedence, no matter what order it's in.

### Installing Kiosktool

<!> This is now unnecessary, as this has been fixed on Debian, you should now be able to simply do an aptitude install.

Kiosktool is simply an easy way of administering the above files. Kiosk Admin Tool is available in Debian Testing/Unstable and should be as simple to install as:

<pre>
$ sudo apt-get install kiosktool
</pre>

Unfortunately the current version of Kiosktool is broken for Debian, as Debian have changed the filename for the menu configuration from applications.menu to kde-applications.menu, and unfortunately Kiosktool is now unmaintained, so to install requires a few more steps than normal:

#### Install the build dependencies

<pre>
$ sudo apt-get build-dep kiosktool
</pre>

<!> Before installing the dependencies, please copy them into the clipboard.

#### Download the source

Note that you do not need to be root to do this, and it helps later if you're not! Change your repository if necessary, or remove it entirely to install from your default repository. Note however that at the time of writing Kiosktool is only available in testing, unstable and backports (the same versions in each).

<pre>
$ apt-get -t etch-backports source kiosktool
</pre>

#### Edit the source

This will download three files: a .orig.tar.gz, a .dsc and a .diff.gz. In the case of packages made specifically for Debian, the last of these is not downloaded and the first usually won't have "orig" in the name. The .dsc file is used by dpkg-source for unpacking the source package into the directory packagename-version. Within each downloaded source package there is a debian/ directory that contains the files needed for creating the .deb package.

Navigate to this directory and open the following file in a text editor:

<pre>
/path/to/kiosktool-1.0/kiosktool/menueditComponent.cpp
</pre>

Replace all instances of applications.menu with kde-applications.menu.

#### Build the deb

From within the directory that was created for the package after downloading.

<pre>
$ apt-get -b source kiosktool
</pre>

To install the package built by the commands above one must use the package manager directly, like this:

<pre>
# dpkg -i kiosktool-<version>.deb
</pre>

#### Remove the build dependencies

It seems that some of the build dependencies may be incompatible with the LTSP enlightened sound daemon (esd), if you copied them (as recommended in Install the build dependencies section), then please purge them now. Otherwise you will need to review /var/log/dpkg.log for the relevant files.

<pre>
$ sudo apt-get --purge remove package1 package2 etc
</pre>

### Using Kiosktool

After installation you should have a menu entry for it in System -> KIOSK Admin Tool, or use the kiosktool command to start it from the command prompt.

You may find that a copying dialog crops up at regular intervals and that often it will stall, please read:

   * Fix kiosk-tool fish protocol stalls

### References

This document was cobbled from the following sources:

   * {APT HOWTO Chapter 6 Working with source packages|http://www.debian.org/doc/manuals/apt-howto/ch-sourcehandling.en.html}
   * {Lock Down Desktops with KDE Kiosk by Carla Schroder|http://www.enterprisenetworkingplanet.com/netos/article.php/3573736}

Other references:

   * http://techbase.kde.org/User:Danimo/KIOSK


The advice in the Edit the source section was copied from a mailing list post, which I now cannot find. The post also mentioned that patches were available for this issue, although I could not find any such patches, and anyway the method above is probably just as easy.
