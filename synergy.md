---
layout: page
title: Synergy Experience
menu: none
category: technology
tags: [synergy]
weight: 10
---

## 2015-11-05T11:20:31 - Client Died

Synergy on server did not appear to be running, but starting it did not fix the problem. For some reason server logs had not been saving, possibly owing to the network path - changed to a local path.

Stopped and Started Synergy on client using a spare keyboard and mouse and it started working again.

    [2015-11-05T11:20:17] INFO: entering screen
    [2015-11-05T11:20:17] DEBUG: ICCCM fill clipboard 0
    [2015-11-05T11:20:17] DEBUG:   available targets: TIMESTAMP (437), TARGETS (436), MULTIPLE (433), SAVE_TARGETS (435), UTF8_STRING (284)
    [2015-11-05T11:20:18] DEBUG: close clipboard 0
    [2015-11-05T11:20:18] DEBUG: sending clipboard 0 seqnum=217
    [2015-11-05T11:20:18] DEBUG: sent clipboard size=4
    [2015-11-05T11:20:18] DEBUG: open clipboard 1
    [2015-11-05T11:20:18] DEBUG: ICCCM fill clipboard 1
    [2015-11-05T11:20:31] NOTE: server is dead
    [2015-11-05T11:20:31] INFO: leaving screen

## 2015-11-04T16:15:37 - Client Died

Stopped and Started Synergy client using a spare keyboard and mouse and it started working again.

Server logs:

    [2015-11-04T16:18:00] NOTE: client "asusi5" is dead
    [2015-11-04T16:18:00] DEBUG: active sides: 2

Client logs:

    [2015-11-04T16:15:37] DEBUG:   available targets: STRING (31)
    [2015-11-04T16:15:39] DEBUG: close clipboard 0
    [2015-11-04T16:15:39] DEBUG: open clipboard 1
    [2015-11-04T16:15:39] DEBUG: ICCCM fill clipboard 1
    [2015-11-04T16:15:41] DEBUG:   available targets: TARGETS (436), SAVE_TARGETS (435), MULTIPLE (433), STRING (31)
    [2015-11-04T16:15:43] DEBUG: close clipboard 1
    [2015-11-04T16:17:45] INFO: entering screen
    [2015-11-04T16:17:45] INFO: leaving screen
    [2015-11-04T16:17:45] DEBUG: open clipboard 0
    [2015-11-04T16:18:00] DEBUG: ssl connection closed

## 2015-11-04T15:47:53 - Client Died

Stopped and Started Synergy client using a spare keyboard and mouse and it started working again.

    [2015-11-04T15:47:53] DEBUG: open clipboard 1
    [2015-11-04T15:47:53] DEBUG: ICCCM fill clipboard 1
    [2015-11-04T15:47:53] DEBUG:   available targets: TARGETS (436), _VIMENC_TEXT (612), _VIM_TEXT (611), UTF8_STRING (284)
    [2015-11-04T15:47:55] DEBUG: close clipboard 1
    [2015-11-04T15:47:55] DEBUG: sending clipboard 1 seqnum=465
    [2015-11-04T15:47:55] DEBUG: sent clipboard size=4
    [2015-11-04T15:48:12] INFO: entering screen
    [2015-11-04T15:48:12] INFO: leaving screen
    [2015-11-04T15:48:12] DEBUG: open clipboard 0
    [2015-11-04T15:48:22] NOTE: server is dead

## 2015-11-04T15:25:05 - Client Died

Stopped and Started Synergy client using a spare keyboard and mouse and it started working again.

    [2015-11-04T15:24:48] DEBUG: ICCCM fill clipboard 0
    [2015-11-04T15:24:48] DEBUG:   available targets: STRING (31)
    [2015-11-04T15:24:50] DEBUG: close clipboard 0
    [2015-11-04T15:24:50] DEBUG: open clipboard 1
    [2015-11-04T15:24:50] DEBUG: ICCCM fill clipboard 1
    [2015-11-04T15:24:50] DEBUG:   available targets: STRING (31)
    [2015-11-04T15:24:50] DEBUG: close clipboard 1
    [2015-11-04T15:24:50] INFO: leaving screen
    [2015-11-04T15:24:50] DEBUG: open clipboard 0
    [2015-11-04T15:25:05] DEBUG: ssl connection closed


