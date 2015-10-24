## Unmute Fix

<<<---
%TOC%
<<<---

### Introduction

There is a problem with some sound cards that start up muted.  This installs a script which responds to settings in lts.conf.

To test this, whilst logged onto the client type:

%RAW%
<PRE>
# alsamixer
</PRE>
%RAW%

If the main volume is at nil and there is "MM" (Muted left and Muted right) at the bottom of the slider, then pressing M to unmute, and the cursor keys to increase the volume, will resolve the problem.  You can experiment with the different channels, like PCM, FRONT and MASTER.  Play to your heart's content, any changes will be lost on reboot.

The only thing is that this fix will be lost next time you boot the client.

### Step 1: Install Script

%RAW%
<pre>
#!/bin/bash
#
# Copyright Gideon Romm, Symbio Technologies
#
# Released under GPLv2
#
# This is a script to set up certain things 
# that are not already setup in an SBA environment
#
# Specifically:
#   1. restore sound levels
#
# lts.conf:
# VOLUME
# PCM_VOLUME
# MIC_VOLUME
# CD_VOLUME
# FRONT_VOLUME

echo "Restoring sound levels" > /tmp/unmute.log

amixer
while [ $? != 0 ]; do
  sleep 1
  amixer
done

# Set up local environment
if [ -f /etc/lts.conf ]; then
    eval `getltscfg -a`
fi

# Set up sound
if [ -n "$VOLUME" ]; then
  amixer sset Master,0 ${VOLUME}% unmute 2>/dev/null
  echo "amixer sset Master,0 ${VOLUME}% unmute 2: $?" >> /tmp/unmute.log
  amixer sset 'Master Digital',0 ${VOLUME}% unmute 2>/dev/null
  echo "amixer sset 'Master Digital',0 ${VOLUME}% unmute 2: $?" >> /tmp/unmute.log
  amixer sset Headphone,0 ${HEADPHONE_VOLUME:-$VOLUME}% unmute 2>/dev/null
  echo "amixer sset Headphone,0 ${HEADPHONE_VOLUME}% unmute 2: $?" >> /tmp/unmute.log
fi

if [ -n "$PCM_VOLUME" ]; then
  amixer sset PCM,0 ${PCM_VOLUME}% unmute 2>/dev/null
  echo "amixer sset PCM,0 ${PCM_VOLUME}% unmute 2: $?" >> /tmp/unmute.log
fi

if [ -n "$MIC_VOLUME" ]; then
  amixer sset Mic,0 ${MIC_VOLUME}% unmute cap 2>/dev/null
  echo "amixer sset Mic,0 ${MIC_VOLUME}% unmute 2: $?" >> /tmp/unmute.log
fi

if [ -n "$CD_VOLUME" ]; then
  amixer sset CD,0 ${CD_VOLUME}% unmute 2>/dev/null
  echo "amixer sset CD,0 ${CD_VOLUME}% unmute 2: $?" >> /tmp/unmute.log
fi

if [ -n "$FRONT_VOLUME" ]; then
  amixer sset Front,0 ${FRONT_VOLUME}% unmute 2>/dev/null
  echo "amixer sset Front,0 ${FRONT_VOLUME}% unmute 2: $?" >> /tmp/unmute.log
fi

echo "Sound levels restored" >> /tmp/unmute.log
</PRE>
%RAW%

### Step 2: Generate rc.d

%RAW%
<pre>
$ sudo chroot /opt/ltsp/i386
# update-rc.d unmute defaults
# exit
$ sudo ltsp-update-image
</pre>
%RAW%

### Step 3: Configure lts.conf

Use the following settings for the particular client:

%RAW%
<pre>
   VOLUME            = 100
   PCM_VOLUME        = 100
   MIC_VOLUME        = 100
   CD_VOLUME         = 100
   FRONT_VOLUME      = 100
</pre>
%RAW%

### Step 4: Reboot client

Reboot the client.  You can check that the script has run by looking at /tmp/unmute.log on the client.  You can get to the client by pressing Ctrl-Alt-F1 and logging in with the root password.

----++ References

   * http://www.debian-administration.org/articles/28
