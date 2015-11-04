---
layout: post
title:  "About LTSP"
date:   2008-06-24 00:00:00
category: technology 
tags: [linux, ltsp]
---

## What is the Linux Terminal Server Project (LTSP)

If you come from a Windows background, you may be familiar with Windows Terminal Services and/or Citrix.  Windows Terminal Services basically enables users from different clients to connect to servers and work concurrently on them using the RDP (Remote Desktop) protocol.  Perhaps you've connected to your work PC using Remote Desktop - it's the same thing, just Terminal Services just allows multiple users to connect concurrently.  Citrix is just the same, but uses the ICA protocol.

<!--more-->

Big Deal.  All Linux machines are inherently multi-user machines and all Linux machines can accept concurrent connections, either using X directly, or using `ssh -XC ~serverip~` (the -X switch enables the X-forwarding so that you have a GUI and the -C switch compresses the data stream which generally improves performance, particularly over low-bandwidth connections).

LTSP goes a massive step further, in that it actually serves a complete operating system to the client.  This means that the client hardware does not require a host operating system, or even a hard drive; instead the client PXE boots over the network, downloading the operating system, installs it, configures it, boots it, and finally runs a login manager to provide a secure login to the server.

In contrast, a Windows thin client usually includes a flash disk with a local operating system.  LTSP does not need this, all LTSP requires is a PXE compatible network card and a pretty minimal amount of RAM and CPU (a Pentium II with 64mb is probably the minimum required).

## Benefits of LTSP

   * Performance
      * LTSP requires around half the processing power - for same performance as Windows Server
         * See Server Sizing for more information
      * LTSP requires around half the memory - for same load as Windows Server
         * See Server Sizing for more information
      * LTSP doesn't require on-access virus scanning - because Linux is inherently secure
      * LTSP runs fast on Pentium II hardware (say Pentium III for LTSP5)
      * LTSP clients boot fast
   * Reliability
      * LTSP will run for longer between reboots - months not weeks
      * PC hard disks can be removed to enable silent running
   * Simplicity
      * No host operating system - boots Linux directly over the network
   * Functional
      * Attractive modern desktop
      * Copes with sound and video (depending on client hardware)
      * Copes with local CDROM and flash memory (depending on client hardware)
   * Cost
      * No need for wholesale PC replacement
      * Hardware-only cost
      * Can afford to over-spec the servers for phenomenal performance

## Problems with LTSP

   * Requires a fast-Ethernet or Gigabit network - Install FreeNX for serving desktops to remote locations
   * Incompatible with Windows applications - see Windows for Linux for guidance 


