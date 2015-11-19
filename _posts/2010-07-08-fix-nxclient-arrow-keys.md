---
layout: post
title: Howto &#124; Fix nxclient arrow keys
menu: howto
date: 2010-07-08 15:59:28
weight: 40
category: technology
tags: [howto, linux, nx, xmodmap]
---

## Introduction

I recently that the arrow keys on my laptop were not working correctly, usually triggering knapshot.  The following webpage addresses this concern.  You should go there now, only read on if that page is gone.

   * http://wiki.laptop.org/go/Remote_Desktop

<!--more-->

## Keyboard mapping

The UK keyboard layout of my laptop is not correctly mapped by the nxclient (which sees it as pc102 instead of pc105). For instance, on a KDE session, the arrow keys are not working, and the Up key thinks it is a PrntScr key and starts ksnapshot! Not really handy... Here is a manual workaround.

When connected remotely to the server, open a terminal and register this keymap configuration with X.

**Please note that these instructions are for the XO and may not be correct - I will correct the following as/when I have time or find problems.**

    $ xmodmap xmodmap.keys

    Content of the xmodmap.keys file
    keycode   8 =
    keycode   9 = Escape
    keycode  10 = 1 exclam exclamdown exclamdown exclamdown exclamdown
    keycode  11 = 2 at notsign notsign notsign notsign
    keycode  12 = 3 numbersign U0300 U0300 U0300 U0300
    keycode  13 = 4 dollar U0301 U0301 U0301 U0301
    keycode  14 = 5 percent U0306 U0306 U0306 U0306
    keycode  15 = 6 asciicircum U030A U030A U030A U030A
    keycode  16 = 7 ampersand U0302 U0302 U0302 U0302
    keycode  17 = 8 asterisk U0324 U0324 U0324 U0324
    keycode  18 = 9 parenleft U0307 U0307 U0307 U0307
    keycode  19 = 0 parenright U0308 U0308 U0308 U0308
    keycode  20 = minus underscore U0304 U0304 U0304 U0304
    keycode  21 = equal plus U0303 U0303 U0303 U0303
    keycode  22 = BackSpace Terminate_Server
    keycode  23 = Tab ISO_Left_Tab
    keycode  24 = q Q Greek_omega Greek_OMEGA Greek_omega Greek_OMEGA
    keycode  25 = w W oslash Oslash oslash Oslash
    keycode  26 = e E oe OE oe OE
    keycode  27 = r R U0327 U0327 U0327 U0327
    keycode  28 = t T U032E U032E U032E U032E
    keycode  29 = y Y U0325 U0325 U0325 U0325
    keycode  30 = u U U032D U032D U032D U032D
    keycode  31 = i I U032C U032C U032C U032C
    keycode  32 = o O U0323 U0323 U0323 U0323
    keycode  33 = p P U0304 U0304 U0304 U0304
    keycode  34 = bracketleft braceleft U0331 U0331 U0331 U0331
    keycode  35 = bracketright braceright U0330 U0330 U0330 U0330
    keycode  36 = Return
    keycode  37 = Control_L
    keycode  38 = a A ae AE ae AE
    keycode  39 = s S ssharp ssharp ssharp ssharp
    keycode  40 = d D eth ETH eth ETH
    keycode  41 = f F thorn THORN thorn THORN
    keycode  42 = g G
    keycode  43 = h H sterling sterling sterling sterling
    keycode  44 = j J EuroSign EuroSign EuroSign EuroSign
    keycode  45 = k K
    keycode  46 = l L
    keycode  47 = semicolon colon masculine ordfeminine masculine ordfeminine
    keycode  48 = apostrophe quotedbl currency currency currency currency
    keycode  49 = grave asciitilde dead_grave dead_tilde dead_grave dead_tilde
    keycode  50 = Shift_L
    keycode  51 = backslash bar section section section section
    keycode  52 = z Z
    keycode  53 = x X
    keycode  54 = c C ccedilla Ccedilla ccedilla Ccedilla
    keycode  55 = v V
    keycode  56 = b B
    keycode  57 = n N ntilde Ntilde ntilde Ntilde
    keycode  58 = m M mu mu mu mu
    keycode  59 = comma less guillemotleft guillemotleft guillemotleft guillemotleft
    keycode  60 = period greater guillemotright guillemotright guillemotright guillemotright
    keycode  61 = slash question questiondown questiondown questiondown questiondown
    keycode  62 = Shift_R
    keycode  63 = KP_Multiply XF86_ClearGrab
    keycode  64 = Alt_L Meta_L
    keycode  65 = space
    keycode  66 = Caps_Lock
    keycode  67 = F1 XF86_Switch_VT_1
    keycode  68 = F2 XF86_Switch_VT_2
    keycode  69 = F3 XF86_Switch_VT_3
    keycode  70 = F4 XF86_Switch_VT_4
    keycode  71 = F5 XF86_Switch_VT_5
    keycode  72 = F6 XF86_Switch_VT_6
    keycode  73 = F7 XF86_Switch_VT_7
    keycode  74 = F8 XF86_Switch_VT_8
    keycode  75 = F9 XF86_Switch_VT_9
    keycode  76 = F10 XF86_Switch_VT_10
    keycode  77 = Num_Lock Pointer_EnableKeys
    keycode  78 = Scroll_Lock
    keycode  79 = KP_Home KP_7
    keycode  80 = KP_Up KP_8
    keycode  81 = KP_Prior KP_9
    keycode  82 = KP_Subtract XF86_Prev_VMode
    keycode  83 = KP_Left KP_4
    keycode  84 = KP_Begin KP_5
    keycode  85 = KP_Right KP_6
    keycode  86 = KP_Add XF86_Next_VMode
    keycode  87 = KP_End KP_1
    keycode  88 = KP_Down KP_2
    keycode  89 = KP_Next KP_3
    keycode  90 = KP_Insert KP_0
    keycode  91 = KP_Delete KP_Decimal
    keycode  92 = ISO_Level3_Shift
    keycode  93 =
    keycode  94 = less greater bar brokenbar bar brokenbar
    keycode  95 = F11 XF86_Switch_VT_11
    keycode  96 = F12 XF86_Switch_VT_12
    keycode  97 =
    keycode  98 =
    keycode  99 =
    keycode 100 =
    keycode 101 =
    keycode 102 =
    keycode 103 =
    keycode 104 = KP_Enter
    keycode 105 = Control_R
    keycode 106 = KP_Divide XF86_Ungrab
    keycode 107 = Print Sys_Req
    keycode 108 = ISO_Level3_Shift
    keycode 109 =
    keycode 110 = Home
    keycode 111 = Up
    keycode 112 = Prior
    keycode 113 = Left
    keycode 114 = Right
    keycode 115 = End
    keycode 116 = Down
    keycode 117 = Next
    keycode 118 = Insert
    keycode 119 = Delete
    keycode 120 =
    keycode 121 =
    keycode 122 =
    keycode 123 =
    keycode 124 =
    keycode 125 = KP_Equal
    keycode 126 =
    keycode 127 = Pause Break
    keycode 128 =
    keycode 129 =
    keycode 130 =
    keycode 131 =
    keycode 132 =
    keycode 133 = Super_L
    keycode 134 = Super_R
    keycode 135 = Menu
    keycode 136 =
    keycode 137 =
    keycode 138 =
    keycode 139 =
    keycode 140 =
    keycode 141 =
    keycode 142 =
    keycode 143 =
    keycode 144 =
    keycode 145 =
    keycode 146 =
    keycode 147 =
    keycode 148 =
    keycode 149 =
    keycode 150 =
    keycode 151 =
    keycode 152 =
    keycode 153 =
    keycode 154 =
    keycode 155 =
    keycode 156 =
    keycode 157 =
    keycode 158 =
    keycode 159 =
    keycode 160 =
    keycode 161 =
    keycode 162 =
    keycode 163 =
    keycode 164 =
    keycode 165 =
    keycode 166 =
    keycode 167 =
    keycode 168 =
    keycode 169 =
    keycode 170 =
    keycode 171 =
    keycode 172 =
    keycode 173 =
    keycode 174 =
    keycode 175 =
    keycode 176 =
    keycode 177 =
    keycode 178 =
    keycode 179 =
    keycode 180 =
    keycode 181 =
    keycode 182 =
    keycode 183 =
    keycode 184 =
    keycode 185 =
    keycode 186 =
    keycode 187 =
    keycode 188 =
    keycode 189 =
    keycode 190 =
    keycode 191 =
    keycode 192 =
    keycode 193 =
    keycode 194 =
    keycode 195 =
    keycode 196 =
    keycode 197 =
    keycode 198 =
    keycode 199 =
    keycode 200 =
    keycode 201 =
    keycode 202 =
    keycode 203 = Mode_switch
    keycode 204 = NoSymbol Alt_L
    keycode 205 = NoSymbol Meta_L
    keycode 206 = NoSymbol Super_L
    keycode 207 = NoSymbol Hyper_L
    keycode 208 =
    keycode 209 =
    keycode 210 =
    keycode 211 =
    keycode 212 =
    keycode 213 =
    keycode 214 =
    keycode 215 =
    keycode 216 =
    keycode 217 =
    keycode 218 =
    keycode 219 = multiply division ISO_Next_Group ISO_Prev_Group ISO_Next_Group ISO_Prev_Group
    keycode 220 = XF86Search
    keycode 221 = XF86Meeting
    keycode 222 =
    keycode 223 =
    keycode 224 =
    keycode 225 =
    keycode 226 =
    keycode 227 =
    keycode 228 =
    keycode 229 =
    keycode 230 =
    keycode 231 =
    keycode 232 =
    keycode 233 =
    keycode 234 =
    keycode 235 = XF86Display
    keycode 236 =
    keycode 237 =
    keycode 238 =
    keycode 239 =
    keycode 240 =
    keycode 241 =
    keycode 242 =
    keycode 243 =
    keycode 244 =
    keycode 245 =
    keycode 246 =
    keycode 247 =
    keycode 248 =
    keycode 249 =
    keycode 250 =
    keycode 251 =
    keycode 252 =
    keycode 253 =
    keycode 254 =
    keycode 255 =

Now, all arrows keys can be used, but the Up one. Go into KDE Control Center. In the Regional & Accessibility/Input Action pane, look for the Preset Action/PrintScreen. In the General tab, click on the Disable check box.
