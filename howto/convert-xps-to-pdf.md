---
layout: post
title: Howto | Convert XPS to PDF
menu: howto
date: 2013-03-12 10:47:53
weight: 40
category: technology
tags: [convert, xps, pdf, linux, cli]
---

## Introduction

XPS is Microsoft's attempt to replace PDF, the only difference is that everyone can read PDFs, and not everyone can read XPS.  I understand that KDE 4 versions of Okular will support XPS, which may make these instructions unnecessary, although having a tool for conversion readily at hand is always useful!

These instructions were tested in Debian Lenny.  These instructions worked for our specific systems YMMV.

## Building from source

    $ sudo apt-get install libxext-dev libxt-dev
    $ wget http://ghostscript.com/releases/ghostpdl-8.71.tar.bz2
    $ tar xvvjf ghostpdl-8.71.tar.bz2
    $ cd ghostpdl-8.71
    $ make xps

## Testing

After the build you will find gxps in xps/obj

To test, you will need a test document in XPS format.

    $ cd xps/obj
    $ ./gxps -sDEVICE=pdfwrite -sOutputFile=test.pdf -dNOPAUSE test.xps

## Move to bin

You probably want to move the gxps executable into a convenient location within your PATH.  /usr/local/bin may be a good destination.  Once there you ought to be able to run the command from anywhere and it just work.  Not sure what your PATH is?  Type "echo $PATH" in your terminal.

    $ echo $PATH
    $ sudo cp xps/obj/gxps /usr/local/bin/
    $ sudo chown root:root /usr/local/bin/gxps

## Creating file type

XPS probably does not exist on your Linux system as a file type, you can either create yourself using KDE Control Centre, or in KDE:

    Single user:
    ~/.kde/share/mimelnk/application/xps.desktop

    All users:
    /usr/share/mimelnk/application/xps.desktop

    [Desktop Entry]
    Comment=XPS Document
    Hidden=false
    Icon=application-xps
    MimeType=application/xps
    Patterns=*.xps;*.XPS
    Type=MimeType
    X-KDE-AutoEmbed=false

## Adding to ServiceMenu

If you are using Konqueror, you can add a service menu (to enable right-click / action menu).

    Single user:
    ~/.kde/share/apps/konqueror/servicemenus/xpstopdf.desktop

    All users:
    /usr/share/apps/konqueror/servicemenus/xpstopdf.desktop

    [Desktop Entry]
    Version=1.0
    Encoding=UTF-8
    Name=xpstopdf service menu
    ServiceTypes=application/xps
    Icon=acroread
    Actions=xpstopdf

    [Desktop Action xpstopdf]
    Icon=acroread
    Name=Convert XPS to PDF
    Exec=cd "%d"; gxps -sDEVICE=pdfwrite -sOutputFile="`echo "%f" | cut -d . -f 1`.pdf" -dNOPAUSE "%f"; mv "%f" ~/.local/share/Trash/files; kdialog --title "Convert XPS to PDF" --passivepopup "Done" 3; echo;

## Testing ServiceMenu

You should now be able to right-click on the file and "Convert XPS to PDF".  This will create a PDF of the same name and move the XPS into trash.

## References

   * [http://www.ghostscript.com/GhostPCL.html](http://www.ghostscript.com/GhostPCL.html)
   * [http://obscured.info/2010/03/01/converting-xps-to-pdf-on-ubuntu-9-10/](http://obscured.info/2010/03/01/converting-xps-to-pdf-on-ubuntu-9-10/)
   * [http://blog.rubypdf.com/2009/04/14/convert-xps-to-pdf-in-two-ways/](http://blog.rubypdf.com/2009/04/14/convert-xps-to-pdf-in-two-ways/)
