---
layout: post
title: Howto &#124; Recover Data from a Hard Disk
menu: howto
date: 2009-03-21 06:21:01
weight: 40
category: technology
tags: [howto, linux, dd, recovery, disk]
---

This is how I recovered data from an NTFS partitioned hard disk, I am not a recovery expert, and it would irresponsible of me to recommend that you follow these instructions.

## Boot in Ubuntu Live CD

   * Boot onto a live CD
   * Configure networking
   * Uncomment repositories in `/etc/apt/sources.list`

<!--more-->

## Mount destination drive

You need access to a hard drive that is able to support large files.  I started with fat32 and came a cropper when it hit 4gb.  I replaced that with an NFS share on my desktop PC and it worked beautifully.  Mount it ready for action.

I will assume that the destination drive has been mounted at `/mnt/destination`

Ensure that the source (broken) drive is not mounted (it shouldn't be unless you mounted it).

## Determine source drive id

You need to find out the id of the source drive.  This will be listed under `/dev` and if it's your primary drive will probably be `/dev/sda` or `/dev/hda`.  If you're not confident, do not proceed.

## Install GNU ddrescue

Note for historical (and hysterical) reasons, the package is named gddrescue in Debian and Ubuntu.

    $ sudo aptitude install gddrescue
    $ man ddrescue

## Run GNU ddrescue

Replace `/dev/sda` for actual source drive, and `/mnt/destination` for action destination drive.

    $ sudo ddrescue -n /dev/sda /mnt/destination/recovered.img /mnt/destination/recovered.log

The "-n" should run faster as it will skip over the errors (although it seemed just as slow to me).

Data recovered is not a fast process, and it will probably take a few days.  The great thing about ddrescue is that you can abort at any time and recommence from where you left off.  You can also skip forward by adding the switch "-i" followed by the number bytes into the disk, e.g. to start from 10gb:

    $ sudo ddrescue -n -i 10000000000 /dev/sda /mnt/destination/recovered.img /mnt/destination/recovered.log

My tip is to keep aborting (Ctrl+C) and skip forward until you pass the area of the disk which is causing problems.  Then, once the bulk of the drive has been recovered you can go back to the sections you skipped, or just move onto the second pass (see next section).

ddrescue will not replace data already recovered, so you can do this safely.

## Run GNU ddrescue again

This time replacing the -n with "-r 1" or perhaps "-r 3" to try more than once to recover the data.

    $ sudo ddrescue -r 1 /dev/sda /mnt/destination/recovered.img /mnt/destination/recovered.log

## Copy the destination image

You don't want to mess up your hard earned image - so copy it and work on the copy.

## Install sleuthkit

On the destination PC, install sleuthkit:

    $ sudo aptitude install sleuthkit
    $ man mmls

## Run mmls

Simply 

    $ sudo mmls copy.img

    DOS Partition Table
    Offset Sector: 0
    Units are in 512-byte sectors

        Slot    Start        End          Length       Description
    00:  -----   0000000000   0000000000   0000000001   Primary Table (#0)
    01:  -----   0000000001   0000000062   0000000062   Unallocated
    02:  00:00   0000000063   0117195119   0117195057   NTFS (0x07)
    03:  -----   0117195120   0117210239   0000015120   Unallocated

## Calculate Offset

This shows several partitions. In this example, we want to mount the NTFS partition starting at block 63. To calculate the number of bytes, multiply by 512:

    63 x 512 = 32256

## Mount partition

For a DOS partition:

    $ sudo mount -o loop,offset=16384 copy.img mountpoint

For an NTFS partition:

    $ sudo aptitude install ntfs-3g
    $ sudo mount -t ntfs-3g -o ro,force,loop,offset=32256 copy.img mountpoint

I appreciate that ntfs-3g provides write access, which we do not need, but "-t ntfs" sinmply would not mount the image.

If it won't mount, then the NTFS partition is probably corrupted (not surprisingly).  Try installing testdisk and then running:

    $ testdisk copy.img

## Extracting files from the disk image

    #### Foremost directory contents
    drwxr-xr-x 30 root root   4096 2009-01-08 18:04 .
    drwxrwxrwx  5 root root   4096 2009-01-08 18:03 ..
    -rw-r--r--  1 root root 888832 2009-01-08 18:15 audit.txt
    drwxr-xr--  2 root root  12288 2009-01-08 18:15 avi
    drwxr-xr--  2 root root  12288 2009-01-08 18:15 bmp
    drwxr-xr--  2 root root  69632 2009-01-08 18:15 dll
    drwxr-xr--  2 root root   4096 2009-01-08 18:10 doc
    drwxr-xr--  2 root root  20480 2009-01-08 18:15 exe
    drwxr-xr--  2 root root 139264 2009-01-08 18:15 gif
    drwxr-xr--  2 root root  20480 2009-01-08 18:15 htm
    drwxr-xr--  2 root root   4096 2009-01-08 18:13 jar
    drwxr-xr--  2 root root 135168 2009-01-08 18:15 jpg
    drwxr-xr--  2 root root   4096 2009-01-08 18:04 mbd
    drwxr-xr--  2 root root   4096 2009-01-08 18:15 mov
    drwxr-xr--  2 root root   4096 2009-01-08 18:04 mpg
    drwxr-xr--  2 root root   4096 2009-01-08 18:14 ole
    drwxr-xr--  2 root root   4096 2009-01-08 18:14 pdf
    drwxr-xr--  2 root root  57344 2009-01-08 18:15 png
    drwxr-xr--  2 root root   4096 2009-01-08 18:04 ppt
    drwxr-xr--  2 root root   4096 2009-01-08 18:14 rar
    drwxr-xr--  2 root root   4096 2009-01-08 18:04 rif
    drwxr-xr--  2 root root   4096 2009-01-08 18:04 sdw
    drwxr-xr--  2 root root   4096 2009-01-08 18:04 sx
    drwxr-xr--  2 root root   4096 2009-01-08 18:04 sxc
    drwxr-xr--  2 root root   4096 2009-01-08 18:04 sxi
    drwxr-xr--  2 root root   4096 2009-01-08 18:04 sxw
    drwxr-xr--  2 root root   4096 2009-01-08 18:04 vis
    drwxr-xr--  2 root root  12288 2009-01-08 18:15 wav
    drwxr-xr--  2 root root   4096 2009-01-08 18:15 wmv
    drwxr-xr--  2 root root   4096 2009-01-08 18:13 xls
    drwxr-xr--  2 root root   4096 2009-01-08 18:14 zip

If it still won't mount, then the general advice seems to be to copy the image to clean hardware and use a Windows recovery disk to boot.  Failing that, all is not lost, there are a number of tools that will search disk images for files.  I played with photorec, but whilst it recovered loads of cached images from IE, it failed to recover more than a handful of proper photos.  Foremost on the other hand seemed to be more successful.

    $ foremost -i copy.img -o output-folder

With luck this will give you a folder that looks like the one to the right.

