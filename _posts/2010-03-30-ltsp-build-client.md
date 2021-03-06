---
layout: post
title: "LTSP | LTSP Build Client"
menu: ltsp
date: 2010-03-30 09:20:54
weight: 10
category: technology
tags: [ltsp]
image: ltsp_logo.png
---

## Command

    ltsp-build-client

## Introduction

The ltsp-build-client command will download a complete Debian filesystem into `/opt/ltsp/i386` (or specify an alternate location with `--base`) and install the ltsp-client and ldm (LTSP Display Manager) packages.  As such, you will probably only run this command the first time you install LTSP5.

<!--more-->

You should move `/opt/ltsp` to `/opt/ltsp_old` before you start.

## Man Page

You should see the man page appropriate for your system, but the Debian Lenny man page current states:

    ltsp-build-client(8)                                                                                                                                                                                               ltsp-build-client(8)

    NAME
        ltsp-build-client - Builds an LTSP client system for use with the LTSP server

    SYNOPSIS
        ltsp-build-client  <options>

    DESCRIPTION
        ltsp-build-client  builds  an  ltsp client chroot using standard packages for use with the ltsp server.  This chroot installation  can be modified in a number of ways as outlined in the OPTIONS section.  If present, defaults
        will be read from the configuration file /etc/ltsp/ltsp-build-client.conf, and will be overridden by using the command line options. ltsp-build-client is usually run as the root  user.   Visit  http://www.ltsp.org  for  more
        information.

    OPTIONS
        Not all options are available on all installations. For a complete list of available options, use the --help and --extra-help options.

        --arch arch
                    Builds a chroot with the specified architecture. Must be a supported architecture of the distribution, and compatible with the host architecture.  Defaults vary by distribution.

        --base dir
                    Sets the default path for the ltsp chroots to be installed into. Defaults to /opt/ltsp/.

        --chroot file
                    Sets the default name for the ltsp chroot. Defaults to the architecture selected with --arch or the running architecture.

        --conf file
                    Load configuration defaults from specified file. See CONFIG FILE below for more information.

        --dist distribution
                    Distribution : Sets the distribution to be installed in the client chroot.  Defaults to the running distribution.

        --extra-help
                    Displays all available commandline options.

        --help    Displays the ltsp-build-client help message.

        --mirror mirror_url
                    Select the mirror to download packages from. file:/// and http:// URLs are supported.

    CONFIG FILE
        ltsp-build-client will read a configuration file to override built-in defaults. the default location for this configuration file is /etc/ltsp/ltsp-build-client.conf, and can be specified with the --conf commandline option.

        values are NAME="VALUE" pairs, with # representing commented lines. most commandline options have an equivalent. an example Debian based system with an alternate base location, architecture, and distribution:

            # set alternate default location for ltsp chroot (--base)
            BASE="/srv/ltsp"
            # build an amd64 chroot by default (--arch)
            ARCH="amd64"
            # build a Debian sid environment (--dist)
            DIST="sid"

    SEE ALSO
        ltsp-update-sshkeys(8), ltsp-update-kernels(8).

    AVAILABILITY
        ltsp-build-client is part of ltsp package and the latest versions are available in source form from https://launchpad.net/products/ltsp.

    MAN PAGE AUTHOR
        Peter Savage
        updated 2006, 2009 by Vagrant Cascadian
