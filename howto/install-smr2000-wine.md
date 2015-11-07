---
layout: post
title: Howto | Install SMR2000 under Wine
menu: howto
date: 2009-11-20 17:45:22
weight: 40
category: technology
tags: [linux, wine, honda]
---

I managed to install the Honda menu-pricing SMR2000 program on Wine:

   * Installed winetricks
   * winetricks: fakeie, vb6run, mdac25, mdac28, jet40, vcrun6, wsh56, allfonts, riched30, mdac27, native_mdac, native_oldaut32, gecko
   * Installed Adobe Reader 8.1.2 from Intranet Downloads
   * Accepted Adobe licence via "wine regedit", `HKEY_CURRENT_USER/Software/Adobe/Acrobat Reader/8.0/AdobeViewer`, add a DWORD "EULA" = "1"
   * Installed SMR2000
   * Updated SMR2000 by running update self-extracting zip files
