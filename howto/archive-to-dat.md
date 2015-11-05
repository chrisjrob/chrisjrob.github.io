---
layout: page
title: Howto | Archive to DAT
menu: howto
weight: 40
category: technology
tags: [linux, cli, archive, dat, tar]
---

## Warning

I am a rank amateur at both tar and mt.  This page constitutes no more than you could discover yourself by reading the manpages for tar and mt, or Googling.

You have been warned!

## Simple instructions

### Rewind

**Use the rewind command before backup to ensure that you are overwriting previous backups.**

    # mt -f /dev/st0 rewind

### Backup

E.g. directory `/www` and `/home` with tar command (z - compressed)

    # tar -czf /dev/st0 /www /home

**Use -v to receive verbose feedback.**

### Backup with Verify

If you do not compress your backup, then you can verify in the same process:

    # tar -cWf /dev/st0 /www /home

### Where

Find out what block you are at with mt command:

    # mt -f /dev/st0 tell

This does not appear to work on my version of the software.  In theory the Status option has a line for `block number=`, but surprising after completing a backup it seems to still return 0.  If I ever work out why this is, I will update this entry.

### List

Display list of files on tape drive:

    # tar -tzf /dev/st0

### Restore

E.g. `/www` directory

    # cd /
    # mt -f /dev/st0 rewind
    # tar -xzf /dev/st0 www

E.g. `/home/test` directory

    # cd /
    # mt -f /dev/st0 rewind
    # tar --checkpoint -xvvzpkf /dev/st0 home/test

    --checkpoint : provide occasional checkpoint messages
    -x : extract
    -v : verbosely
    -v : even more verbosly
    -z : uncompress
    -p : retaining permissions
    -k : leaving existing files alone
    -f /dev/st0 home/test

### Unload

Unload the tape:

    # mt -f /dev/st0 offline

### Status

Display status information about the tape unit:

    # mt -f /dev/st0 status

### Erase

Erasing the tape may take hours and there is not normally any need to do this; simply rewind the tape before performing backup, or use the mt command to position at the beginning of the tape.

    # mt -f /dev/st0 erase

### Moving about the tape

You can go BACKWARD or FORWARD on tape with mt command itself

#### Go to end of data

    # mt -f /dev/st0 eod

#### Goto previous record

    # mt -f /dev/st0 bsfm 1

#### Forward record

    # mt -f /dev/st0 fsf 1

## Restore

This code has not been checked or tested:

   * Check status of tape: `mt -f /dev/st0` status
   * Go to the directory where you want to restore your file(s).
   * Go to the right file on the tape with the following commands:
      * Check file number and position in file: `mt -f /dev/st0 status`
      * Advance one file: `mt -f /dev/st0 fsf 1`
      * View contents of tar-file: `tar -tvf /dev/st0`
      * Go back one file: `mt -f /dev/st0 bsf 1`
      * If you are in the last block of a file and you should be at the beginning of the file, do the following:

         `mt -f /dev/st0 bsf 1`

         `mt -f /dev/st0 fsf 1`

      * And check with: `mt -f /dev/st0 status`
   * Extract your file(s): `tar -xvf /dev/st0 ~files~`
   * Rewind and eject tape: `mt -f /dev/st0 offline`

## Hardware Compression

It may be possible to switch off and on the hardware compression on the:

    # mt -f /dev/st0 compression 0
    # mt -f /dev/st0 compression 1

Other people report replacing the 0 with "off" and 1 with "on".

## References

   * man tar
   * man mt
   * [Howto: Linux Tape Backup with MT and TAR commands](http://www.cyberciti.biz/faq/linux-tape-backup-with-mt-and-tar-command-howto/)
   * [How to use the DAT-tape with Linux](http://www.cs.inf.ethz.ch/stricker/lab/linux_tape.html)
   * [Verify tar command tape backup under Linux or UNIX](http://www.cyberciti.biz/faq/unix-verify-tape-backup/)
   * [Tape drives naming convention under Linux](http://www.cyberciti.biz/faq/tape-drives-naming-convention-under-linux/)
   * [Backup home directories in Linux](http://www.cyberciti.biz/faq/backup-home-directories-in-linux/)
   * [Howto: Use tar command through network over ssh session](http://www.cyberciti.biz/faq/howto-use-tar-command-through-network-over-ssh-session/)
   * [Linux Set the Block Size for a SCSI Tape Device](http://www.cyberciti.biz/faq/rhel-centos-debian-set-tape-blocksize/)

