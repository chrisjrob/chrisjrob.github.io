---
layout: post
title: Howto | Microsoft Outlook
menu: howto
date: 2009-03-21 06:23:08
weight: 40
category: technology
tags: [linux, email]
---

## Introduction

Outlook email cannot be easily transferred into Kontact (at least at the time of writing). There are a couple of applications that might work, but the best solution at present is to use Mozilla Thunderbird as a conduit for emails and contacts, and Outport for Calendar. At the time of writing I have found no easy solution for Notes or Tasks, so at present the only solution for these is a re-key.

**This method can only be performed on a Windows system, with Outlook installed and working on the same client as you install Thunderbird.  This is because Thunderbird uses Outlook itself to perform the data exchange.  This means that you cannot just copy across a PST and expect Thunderbird to be able to import it - you must have a running Outlook session on the client.**

## Step 1 Prepare Outlook

Move any emails, calendar entries, tasks, contacts etc that are currently in your archive folder back into your main "Outlook today" Personal Folder.

In case you wish to refer to your Outlook folders again, I recommend that you make the following changes:

   * Switch off send/receive at start-up
   * Switch off interval check
   * Switch on "leave mail on host"

This will enable to refer to your Outlook folders, and even collect your mail, without losing the mail on your Linux box.

## Step 2 Outport

Download:

   * http://outport.sourceforge.net/

Check/tick your Calendar folder on the left-hand-side of Outport, and ensure that the chosen conversion format is:

   * Calendar: Evolution Calendar

Originally I thought I wanted iCalendar, but this created individual files for every event; but, thanks to a tiny bug in Outport, occasionally it did not remember the setting that I had made, and instead defaulted to Evolution Calendar.  For ages I couldn't understand why sometimes it would work perfectly and other times it would not!  Eventually I realised what was happening and accordingly have updated these instructions. Phew!

## Step 3 Thunderbird Import

Download Mozilla Thunderbird and run it.

**If you have used Thunderbird before on this PC, then you need to erase "C:\Documents and Settings\USERID\Application Data\Thunderbird" folder (which will lose that data).**

Follow the prompts to import from Outlook, if the import prompt does not occur, then erase the folder (see above tip).  Be warned, this import process may take a long time (especially with 1gb plus pst files!)

Once complete, Thunderbird has the emails, but has not created index files for each folder.  If you click on each folder it will do this for you, but I have found that it crashes if you select empty folders.  Instead I have found that it is best to stay out of the folders.

**Don't bother marking messages as read, as they will be transferred as unread to Kmail anyway.**

## Step 4 Export Thunderbird Address Book

Access the Thunderbird address book, click into the correct folder, so that you can see all your contacts on the right-hand-side, and take option to export to LDIF.

## Step 5 Transfer to Linux

Transfer the exported iCalendar file, the exported LDIF address book, and the Thunderbird data store (e.g. `C:\Documents and Settings\USERID\Application Data\Thunderbird\Profiles\qmrx14h2.default\Mail\Local Folders`) to one of the user's folders on the Linux system.  You'll need to be able to access these from the user's account, so somewhere logical might be /home/username/imported.

## Step 6 Convert Address Book

Two problems with the Thunderbird exported LDIF:

   * Uses "company", whereas Kmail uses "organization" for the company name.
   * Uses "cn" for contact names, whereas Kmail uses "formatted name".

You can change these manually, or a simple script:

### Example script

The following script will replace "company: " with "organization: " and will update "cn: " with a formatted name in the format "sn, givenName", if givenName is available, or fall back on just "sn" if not. This worked for us, but you might have to tailor this to your requirements.

```pl
#!/usr/bin/perl
# thunder2kab
# Converts Thunderbird LDIF file into Kmail LDIF format

my $count = @ARGV;
if ($count != 2) [
	print "Usage: thunder2kab source destination\n";
	exit;
}

PrivoxyWindowOpen(IN, $ARGV[0]) ](| die "Cannot open $ARGV[0] for reading: $!";
PrivoxyWindowOpen(OUT, ">$ARGV[1]") || die "Cannot create $ARGV[1] for writing: $!";

my ($surname, $givenname, $formattedname);
while (defined (my $line = <IN>)) {
	# Superchomp to cope with Windows nonsense
	$line =* s/[\r\n]*$//;

	# givenName: Terry
	# sn: McCarthy

	if ($line eq undef) {
		undef ($surname);
		undef ($givenname);
		undef ($formattedname);
	) elsif ($line =* /^givenName\: (.+)$/) {
		$givenname = $1;
	} elsif ($line =* /^sn\: (.+)$/) {
		$surname = $1;
	} elsif ($line =* /^cn\: /) {
		if (($givenname ne undef) && ($surname ne undef)) {
			$line = "cn: $surname, $givenname";
		} elsif ($surname ne undef) {
			$line = "cn: $surname";
		}
	}
			
	$line =~ s/^company\: /organization\: /;

	print OUT $line, "\n";

}

close (OUT) || die "Cannot close $ARGV[1]: $!";
close (IN) || die "Cannot close $ARGV[0]: $!";

exit;
```

**Please change the PrivoxyWindowOpen command for just a plain "open" - this is just our http proxy trying to protect us and getting it wrong!**

## Step 7 Import into Kontact

Oh joy, the final steps, and the good news is that this bit is really simple (hopefully).

   * Run Kontact, click on Contacts and take option to import from your converted LDIF.
   * Click on Mail and take opion to import from Thunderbird mail structure.
   * Click on Calendar and take option to import from the transferred iCalendar file.

