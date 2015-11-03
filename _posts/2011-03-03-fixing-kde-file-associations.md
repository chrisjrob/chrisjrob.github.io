--- 
layout: post 
title: Fixing KDE File Associations
date: 2011-03-03
type: post 
published: true 
status: publish
category: technology linux kde
tags: kiosktool
---

We have our file associations locked down using KDE Kiosktool, and yet
it seems that one of our users has managed to change their file
associations, despite them being locked down; which seems to be because
the context menu is not locked down, enabling him to take the option to
Open With an alternative application and select the checkbox to remember
that association in future.  The only way around this would seem to be
to disable the context sensitive menu, at a significant cost in
functionality.

<!--more-->

So now this user's PDFs open in Acrobat Reader **on our Windows
server**, instead of using Acrobat Reader on Linux.  That would not in
itself cause a problem, except that the Windows server cannot access the
location of the temporary location of Kmail attachments.  I could
probably fix that, but I don't really want users opening email
attachments using Windows applications.

This user cannot access File Associations to fix this problem, as the
menu option is removed; so I need to find a way to fix this problem from
the command line.

In solving this particular problem I discovered the existence of the
users' `~/.local/share/application` directory, and was able to remove the
application shortcut to the PDF and normal functionality was restored,
but I thought it would be worth writing up what I have found to be the
case.  Some of the following information may be wrong or misleading and
please feel free to comment any issues, and I will endeavour to update
this page accordingly.

KDE File Associations
---------------------

I have to say that KDE file associations seem hellishly complicated,
which is to say that there are so many different locations of files that
it is very difficult to work out what is happening.  The three key
factors in play seem to be:

### MIME Types

Mime-types, appear to be stored in:

  * `~/.kde/share/mimelnk` directories (for each user)
  * `/usr/share/mimelnk`
  * `/etc/kde-profile/standard/share/mimelnk` (for kiosktool - a symlink
    back to `/usr/share/mimelnk`)

These look like this:

    $ cat pdf.desktop
    [Desktop Entry]
    Comment=PDF
    DocumentHidden=false
    Icon=application-pdf
    MimeType=application/pdf
    Patterns=*.pdf;*.PDF
    Type=MimeType
    X-KDE-AutoEmbed=false

In other words they link the file extension, in this case `*.pdf`, with
the MimeType, in this case `application/pdf`.  I believe I am right in
saying that the users' files take precedence over the global ones.

### Application Shortcuts

Next up are the application shortcuts, and these also can be in diverse
locations:

  * `~/.kde/share/applnk`
  * `~/.local/share/applications`
  * `/usr/share/applications`
  * `/etc/kde-profile/standard/share/applications` (for kiosk-tool)

As with the mimetypes, the users' copy take precedence over the shared
ones.  These application shortcuts define how to run an application, and
look something like this:

    $ cat "Adobe Reader 9 PDF Viewer.desktop"
    [Desktop Entry]
    Comment=
    Exec=acroread
    GenericName=PDF
    ViewerIcon=AdobeReader9
    MimeType=
    Name=Adobe Reader 9
    Path=
    StartupNotify=false
    Terminal=0
    TerminalOptions=
    Type=Application
    X-KDE-SubstituteUID=false
    X-KDE-Username=

As you can see, this tells the system how to run the application.

### profilerc

Lastly there needs to be some way of tying the above two things
together, something that tells the system that you use X application
shortcut to open Y mime-type, and this appears to be the role of the
`profilerc` files.  As with the other components, there are multiple
copies of this file:

  * `~/.kde/share/config/profilerc`
  * `/etc/kde-profile/standard/share/config/profilerc`

An extract of this file in respect of my PDF example, looks something
like this:

    [application/pdf - 1]
    AllowAsDefault=true
    Application=Adobe Reader 8 PDF Viewer.desktop
    GenericServiceType=Application
    Preference=2
    ServiceType=application/pdf
    [application/pdf - 2]
    AllowAsDefault=true
    Application=kpdf_part.desktop
    GenericServiceType=KParts/ReadOnlyPart
    Preference=1
    ServiceType=application/pdf
    [application/pdf - 3]
    AllowAsDefault=true
    Application=kde-kpdf.desktop
    GenericServiceType=Application
    Preference=2
    ServiceType=application/pdf

This shows both the mime-type `application/pdf` and the application
shortcut, e.g. "Adobe Reader 8 PDF Viewer.desktop", and gives the
different choices for opening the same mimetype.

I have found this exercise to be hugely frustrating, and I hope this
information is of use to someone.  As I said earlier, my intention will
be to correct this post as I find out more, so please forgive any
errors, and if you have the time, please do let me know by commenting
below.

