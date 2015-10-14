---++ 08/12/2008: Lenny on Speed

Okay, to be quite honest my Debian Lenny 64-bit Toshiba Satellite Pro A300 laptop is really fast.  Certainly the fastest machine that I've ever used, problem is that makes you hungry for more speed.  So far I have followed several of the suggestions included in this {Debian EeePC page|http://wiki.debian.org/DebianEeePC/TipsAndTricks}, for example adding the relatime option to the disks.  I've also switched on boot concurrency and installed preload, as discussed in {this forum thread|http://forums.debian.net/viewtopic.php?t=31275}.  Early days, but it does feel very snappy indeed.  The bootup doesn't seem much faster, although apparently preload can slow things up a tad, but it is still around one minute, including about 5 seconds for the bios and another 15 seconds for typing in the kdm and kwalletmanager passwords.

I've also moved the unmountnfs.sh from the shutdown scripts to position 14, to enable this to be completed before closing the network services.  This has dramatically improved the shutdown performance.

Follow these links for more information:

   * http://wiki.debian.org/DebianEeePC/TipsAndTricks
   * http://forums.debian.net/viewtopic.php?t=31275

Lastly, exim4 is installed by default, but you really don't need this if, like me, you send/receive mail through a dedicated server, this shaves a second or two from the boot process.
