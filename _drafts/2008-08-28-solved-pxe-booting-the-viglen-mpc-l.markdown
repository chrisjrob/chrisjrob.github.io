---++ 28/08/2008: Solved PXE Booting the Viglen MPC-L

To get past the kernel panic, it was necessary to switch of acpi in the kernel.  In LTSP that means copying the following file:

<?> Replace 00-00-00-00-00-00 with the MAC address of the Viglen but note it has to have the leading 01 at the beginning

<pre>
# cp /var/lib/tftpboot/ltsp/i386/pxelinux.cfg/default /var/lib/tftpboot/ltsp/i386/pxelinux.cfg/01-00-00-00-00-00-00
</pre>

Then edit the file and add "acpi=off" to the end of the line (I also added pnpbios=off to reduce the boot-up error messages):

<pre>
DEFAULT vmlinuz ro initrd=initrd.img quiet root=/dev/nfs ip=dhcp boot=nfs acpi=off pnpbios=off
</pre>

And it boots up fine.
