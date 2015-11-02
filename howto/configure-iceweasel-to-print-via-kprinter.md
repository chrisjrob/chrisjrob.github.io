---
layout: page
title: Howto | Configure Iceweasel to print via Kprinter
menu: howto
weight: 40
---

## Configure Iceweasel to print via Kprinter

### Introduction

Iceweasel and Firefox do not use the KDE Print system, but instead print directly to CUPs.  This works fine, but can be confusing, as it looks different and doesn't offer all the same functions, like PDF etc.

Trying to resolve this issue, I came across this posting:

   * [How To: Make Firefox / Thunderbird print to kprinter automatically in KDE / Kubuntu](http://ubuntuforums.org/showthread.php?t=205050) by msak007

### Single User

#### Step 1 Print to Postscript

First, if you haven't done so, you need to print to PostScript in order for the needed entry in `prefs.js` to be populated. This will be done automatically the first time you print. Open any web page and go to:

File &rarr; Print &rarr; choose PostScript/default (it should be the default if you haven't installed any printers yet) &rarr; click "Print"

Once you have done this and it prints, it'll add the PostScript entry you need to edit.

#### Step 2 Change default postscript printer

In the URL bar, open the config by typing:

    about:config

In the "Filter" bar, type

    print.printer_PostScript/default.print_command

This should filter everything out but that line.

Right-click on the line, click on "Modify", and change the entry from:

    lpr ${MOZ_PRINTER_NAME:+-P"$MOZ_PRINTER_NAME"}

to:

    kprinter

Then click OK. This will make Iceweasek print to kprinter any time you select the "PostScript/default" printer.

#### Step 3 Set it to print automatically

Right-click anywhere in the white space, then click on "New &rarr; Boolean" to add a new Boolean entry. Type:

    print.always_print_silent

And set its value to "true". This will force Iceweasel to print to the default printer without prompting you.

#### Step 4 Disable CUPs

If "PostScript/default" is the only printer you have and there are no local / network printers, it works great and you can stop here. But if you installed a printer through CUPS, it complicates things as Iceweasel will want to use that as a default and all your prints will go there without prompting you! So even if you don't have a local printer, it's a good idea to add the following line in case you add one later.

Once again, right-click and choose "New &rarr; Boolean". Type:

    print.postscript.cups.enabled

And set its value to "false". That will disable CUPS printing in Iceweasel, and it will default to the "PostScript/default" printer. And since you've changed the output of that to kprinter, you'll see a "processing" dialog for a split second when you print, after which kprinter will open up. There you can choose all your printers, including PDF, PostScript, and any CUPS installed printers.

### Multi-user

There is a file that controls global settings, but it's not `prefs.js` - it's called (ironically) `firefox.js`, and is located in:

    /usr/share/iceweasel/defaults/pref

Make sure you have Firefox closed and edit the file using your favorite editor.

    $ cd /usr/share/iceweasel/defaults/pref/
    $ sudo cp firefox.js firefox.js.backup
    $ kdesu kate firefox.js

Enter your password, and when Kate opens up add the following to the very end of the file:

    // Print to kprinter by default for all users
    pref("print.postscript.print_command", "kprinter");
    pref("print.print_command", "kprinter");
    pref("print.always_print_silent", true);
    pref("print.postscript.cups.enabled", false);

Save the file and launch Firefox. This will not overwrite or modify and user set entries (the entries in bold in about:config), so it will only affect new profiles. If you've already modified your profile, this will not change any of the settings in it.
