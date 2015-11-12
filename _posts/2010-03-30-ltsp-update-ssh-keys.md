---
layout: post
title: "LTSP | LTSP Update SSH Keys"
menu: ltsp
date: 2010-03-30 09:20:24
weight: 10
category: technology
tags: [ltsp, ssh]
---

<img src="/assets/ltsp_logo.png" class="image-right" alt="LTSP Logo">

## Command

    ltsp-update-sshkeys

## Introduction

Secure Shell Handler or SSH is a network protocol that allows data to be exchanged using a secure channel between two computers.  LTSP uses it to enable secure communication between clients and the Server.  SSH uses public-key cryptography to authenticate the client, this command rebuilds the keys.

<!--more-->

You would run this command only at first install, or upon subsequent change of server IP addressing or DHCP or possibly hosts.  Basically if you get the "workstation not authorised" message, then you should run this command.

