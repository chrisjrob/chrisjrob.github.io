## LTSP Client Hardware

<<<---
%TOC%
<<<---

### Introduction

The selection of client hardware is an interesting topic, that causes much confusion for those unfamiliar with LTSP.  When you start out with LTSP, the likelihood is that one of your motivations is to extend the life of your existing clients.  But you'd be lucky indeed not to require a few new clients, and of course over time you will need to purchase replacements for hardware failures.  So what are your options?

### Options

   * Existing PCs
   * Thin clients designed for LTSP
   * Thin clients designed for Citrix
   * Barebones PCs
   * Self-build PCs
   * New PCs

### Existing PCs

Well you obviously don't want to throw out all your existing hardware, but do bear in mind that the electrical cost is likely to be around &pound;40 a year, and so a replacement that brings this down to &pound;15 a year, might be easier to justify than you might imagine.  If you do want to keep your existing PCs, then do consider unplugging the hard drives.  Hard drives are not required on LTSP clients, and they consume unnecessary power.  They also can often be noisy, unplugging an old drive can miraculously silence an annoyingly loud older PC.

### Thin clients designed for LTSP

I have no experience of this route.  One option is to purchase from Diskless Workstations, who support the LTSP project.

   * http://www.disklessworkstations.com/

### Thin clients designed for Citrix

I have had mixed success with thin clients that were designed for Citrix and/or Windows Terminal Services.  The Wyse terminals tend to be very sluggish and quirky, and I find that I cannot recommend them for LTSP.

HP thin clients seem to work very much better, and are certainly an option.  Such devices tend to be very low power.  On the downside, they do tend to be surprisingly expensive, for what they provide.  That said, if you have a good hardware budget, I believe you could do very much worse that buy some HP Linux Thin Clients but, as with any client hardware, do buy one and test before committing yourself to considerable expenditure.

### Barebones PCs

Obviously the above is probably not true of dedicated LTSP thin client hardware, designed from the ground up to work with LTSP.

I have found that the best client hardware is to purchase low-cost barebones PCs, low-power and preferably fanless.  I tend to only buy barebones PCs that include the CPU, in order to keep down the overall cost and keep commissioning time to a minimum.  Previously this meant Via C7 CPUs, which haven't the best reputation; although so far I have not had any failures.  Nowadays I think you'd be searching for "intel atom barebones".

Yes, you need to open the case, add some RAM, and maybe add an optical drive - perhaps 10 minutes work - the flipside is that you're not paying for an operating system, and you're not paying for a hard drive (which you don't need). 

Such barebones PCs currently cost about &pound;125 (plus VAT), seem much less likely to have compatibility issues, perform much faster than dedicated "thin client" devices, and could easily be changed to fat clients, should your requirements subsequently change.

### Self-build PCs

I have had great success building small Mini-ITX form factor PCs, on Via CPUs.  The hardware was all purchased from LinITX.com, who I found very helpful.  Build time was about an hour for the first, but this dropped to about 30 minutes for the remaining ones.  The result are stunningly attractive tiny PCs which grace our showroom.  Just do concentrate on low-power consumption and look where possible for "fanless".  LTSP uses very little of the local CPU, so heat is unlikely to be an issue.

### New PCs

Full blown desktops are, I think, a poor option.  These tend to be power hungry, and come with a Windows licence, hard drive and other bits that you will not need.  There are a new generation of tiny PCs like the Acer Reevo and the Asus EeeBox, which may be a good option.

### References

There are no references for this page, which was written without reference to other information.
