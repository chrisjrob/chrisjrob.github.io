---
layout: page
title: "LTSP | Create a Custom LDM Theme"
menu: ltsp
weight: 12
category: technology
tags: [ltsp]
---

## Paths

The ldm-theme is loaded from a symlink at:

    /opt/ltsp/i386/usr/share/ldm/themes/default

Which points to further symlink at:

    /opt/ltsp/i386/etc/alternatives/ldm-theme

Which points back to :

    /opt/ltsp/i386/usr/share/ldm/themes/ltsp

## Copy existing theme

Copy this ltsp directory, e.g.:

    # cd /opt/ltsp/i386/usr/share/ldm/themes
    # cp -r ltsp custom
    # cd custom
    # ls -al

## Set symlink to new theme

Then you need to change the symlink to point to your new theme:

    # cd /opt/ltsp/i386/etc/alternatives
    # rm ldm-theme
    # ln -s /usr/share/ldm/themes/custom ldm-theme

## Customise your custom LDM theme

Now you can customise your ldm theme to your heart's content.  Please note that editing the bg.png currently has no effect (hence the existence of this page!), but you can at least tidy up the login page by replacing the logo.png with something tidier than the current ltsp.org logo, which looks dreadful on the grey background (because of a transparency issue).

### Change background colour

Firstly change the background colour to your desired background colour (personally I quite like the light grey of "efebe7"), so left it like that.

You can change the colour of the background by opening the greeter-gtkrc in your theme and looking for the following line:

        bg[NORMAL]        = "#efebe7"

Change the colour for whatever colour you wish.  Under KDE you can use the KColorChooser for this purpose, or indeed the colour picker in Gimp.

### Create new logo

Next open your organisation's logo in the Gimp (or whatever logo you wish to appear on LDM login).  Add a shadow (Script4u &rarr; Shadow &rarr; Drop Shadow), I would suggest making the X/Y offsets 0/0.  You can play with the radius and opacity to create the effect you desire.

Next create a new layer of the same colour as the background (e.g. efebe7 unless you changed it) and put that background at the bottom of the layers.  The gimp makes this easy by enabling you to key in the efebe7 in the colour picker.

Save the resulting image as logo.png into your custom ldm theme.

