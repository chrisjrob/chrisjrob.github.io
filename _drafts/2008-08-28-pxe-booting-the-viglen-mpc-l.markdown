---++ 28/08/2008: PXE Booting the Viglen MPC-L

Persistence paid off, in that F1 will work, but it is a race between the detection of the USB keyboard and the completion of the boot loader.  I found that if I moved the cursor on the grub screen it paused, enabling me to Ctrl-Alt-Del, which seemed to enable to USB detection to complete quicker.  Or perhaps I was just lucky.  But in fact it's immaterial as the PXE boot settings are not there, but are instead under Shift-F10, which seems to work fine.

Unfortunately the PXE boot to LTSP ends in a kernel panic - but at least I am one step closer!
