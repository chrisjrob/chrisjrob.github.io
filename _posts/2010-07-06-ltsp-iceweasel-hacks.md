---
layout: post
title: "LTSP | LTSP Iceweasel Hacks"
menu: ltsp
date: 2010-07-06 15:06:17
weight: 10
category: technology
tags: [ltsp, web]
---

<img src="/assets/ltsp_logo.png" class="image-right" alt="LTSP Logo">

## Introduction

This is just a list of the hacks or fixes that I currently have in place on Iceweasel.  These were not my invention, and surely I owe a debt of thanks to various sites; unfortunately I have no way of knowing which sites.

Some of these hacks are too facilitate system wide control, others help to maximise performance on a thin client system.

<!--more-->

## Iceweasel Global Preferences

`/etc/iceweasel/pref/iceweasel.js`

```js
// This is the Debian specific preferences file for Iceweasel
// You can make any change in here, it is the purpose of this file.
// You can, with this file and all files present in the
// /etc/iceweasel/pref directory, override any preference that is
// present in /usr/lib/iceweasel/defaults/preferences directory.
// While your changes will be kept on upgrade if you modify files in
// /etc/iceweasel/pref, please note that they won't be kept if you
// do make your changes in /usr/lib/iceweasel/defaults/preferences.
//
// Note that lockPref is allowed in these preferences files if you
// don't want users to be able to override some preferences.

lockPref("extensions.update.enabled", true);

// Use LANG environment variable to choose locale
lockPref("intl.locale.matchOS", true);

// Disable default browser checking.
lockPref("browser.shell.checkDefaultBrowser", false);

// ========= LTSP SPECIFIC HACKS ========

// Disable "safe browsing" feature that hogs CPU, HDD, etc. etc. in LTSP
lockPref("browser.safebrowsing.enabled", false);
lockPref("browser.safebrowsing.malware.enabled", false);

// Disable annoying location-bar suggestion "feature" that is sludgy with thin-clients
lockPref("browser.urlbar.maxRichResults", 0);

// Disable offline/disk caching of web pages
lockPref("browser.cache.offline.enable", false);
lockPref("browser.cache.disk.enable", false);
lockPref("browser.cache.memory.enable", false);

// ========= PROXY HACKS =========

lockPref("network.proxy.type", 1);
lockPref("network.proxy.share_proxy_settings", true);
lockPref("network.proxy.http", "192.168.1.254");
lockPref("network.proxy.http_port", 800);
lockPref("network.proxy.no_proxies_on", "localhost, 127.0.0.1, 192.168.1.0/24");

// ========= MISC HACKS ==========

lockPref("browser.startup.homepage", "http://www.example.co.uk/");
lockPref("app.update.enabled", false);
```

## Iceweasel Image Caching

I understand that, on websites with certain size of image, that the thin client xorg starts to take a ridiculous amount of memory, resulting xorg dieing and the thin client returning to the login page.  The following may help:

    $ sudo echo "MOZ_DISABLE_IMAGE_OPTIMIZE=1" >> /etc/profile

## References

I must apologise for the lack of references, if you recognise some of your work in the above, please do accept my apologies.
