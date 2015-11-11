--- 
layout: post 
title: Go Kart Repair
date: 2014-06-08
type: post 
published: true 
status: publish
category: technology
tags: [3dprint, 3dmodel, reprap, openscad, github]
---

<img src="/assets/gokart-08.jpg" class="image-right" alt="Go Kart">

At a dinner party a few months ago, the host asked if I could repair
their go-kart, using my RepRap 3D Printer. Apparently the steering wheel
had broken off and the Chinese supplier refused to supply only the
steering wheel. I accepted the challenge, but did warn that PLA was not
the ideal plastic for such a repair, being somewhat brittle.

<!--more-->

I decided to approach the problem by removing all the broken plastic
from the back of the steering wheel, and [designing a new
part](http://www.fabfabbers.com/models/id/203/gokart-repair-by-chrisjrob "FabFabbers - Go-kart repair")
to slot over the steering column nut and bolt onto the remains of the
steering wheel.

<table>
  <tr>
    <td><img src="/assets/gokart-01.jpg"></td>
    <td><img src="/assets/gokart-02.jpg"></td>
  </tr>
  <tr>
    <td><img src="/assets/gokart-04.jpg"></td>
    <td><img src="/assets/gokart-05.jpg"></td>
  </tr>
  <tr>
    <td><img src="/assets/gokart-06.jpg"></td>
    <td><img src="/assets/gokart-07.jpg"></td>
  </tr>
  <tr>
    <td><img src="/assets/gokart-08.jpg"></td>
    <td><img src="/assets/gokart-09.jpg"></td>
  </tr>
</table>

Having designed the part, I [posted it to
Google+](https://plus.google.com/112653355770650909703/posts/bauW56mMF9p "Google+ Post")
for advice. [Wildseyed
Cabrer](https://plus.google.com/103153642711282733992) suggested that I
do away with the buttresses
of [v1](https://github.com/chrisjrob/gokart-repair/tree/v1) and instead
design a solid cylinder. Of particular interest was his suggestion to
use pinholes around the nut hole, to force the slicing program to add
reinforcement. [Andreas
Thorn](https://plus.google.com/+AndreasThorn1) reminded me to use the
\$fn = 6 for the chamfering of the nut hole, as I had for the nut hole
itself. The Google+ 3D printing community really is amazing - thank you.

Unfortunately printing the item was much delayed by the fact that I did
not have the precise measurements. As always I had designed the item to
be fully parametric; so that the exact measurements didn't matter until
I came to print. Unfortunately the owners of the go-kart did not feel
able to accurately take the measurement; so instead the go-kart had to
be delivered to our house.

Having measured and printed the final part, I was delighted that it all
worked first time. The only issue was that it was very difficult to turn
the wheel and I was concerned that the part would not indeed be strong
enough. I noticed that all four tyres were completely flat, so much so
that the tyre profile was concave rather than convex. This was clearly
putting a huge strain on the steering and may well have been a
contributory factor in the original breakage. Having pumped up all the
tyres the steering was very much easier.

The repair complete, the go-kart was delivered back to the owners. I
have no idea whether the repair will last long enough to be worthwhile,
but providing it lasts a reasonable time, it can of course be simply
reprinted. We could also consider having it professionally printed in a
stronger plastic.

-   [View design at
    FabFabbers](http://www.fabfabbers.com/models/id/203/gokart-repair-by-chrisjrob "FabFabbers - Go-kart repair")

