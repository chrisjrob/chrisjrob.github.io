---
layout: post
title: Make My Year with Vibe Coding
date: 2026-02-13 17:14:49
type: post
published: true
category: technology
tags: [codex, chatgpt, vibecoding, ai]
image: calendar-month-blue-400x283.jpg
caption: MakeMyYear.com
---

Around Christmas each year, I produce printed PDF monthly calendars for my wife, incorporating our family’s anniversaries and other important dates.

<!--more-->

Originally this was done in a spreadsheet, but that was always a headache, especially when multiple events shared the same date.  One year, I gave up and replaced the spreadsheet with a Perl script using `PDF::API2` and this has worked well for a number of years.
But, being CLI-based, this remained on my annual to-do list.

The idea to create a web front-end through *Vibe Coding* came from an episode of the [Linux Matters Podcast](https://linuxmatters.sh/), in which the hosts discussed maintaining a living specification document and using AI to generate an application directly from that specification. The process they described was disciplined: refine the specification, regenerate the system, repeat - until the specification itself becomes the definitive source of truth.


## The process

I started by asking ChatGPT whether my choice of Perl + Dancer would be suitable, or whether a different language and web framework would be likely to produce better results. Sadly, ChatGPT felt that Codex would be much more effective using a more popular combination and, of the choices suggested, I opted for Ruby with Sinatra. I had previously used Ruby on Rails, but had found it to be too difficult to maintain.  Sinatra is a more lightweight web framework that keeps structure simple and avoids unnecessary abstraction.  For the same reason, I chose Sequel for the database layer instead of ActiveRecord.

The project was broken into sections - creating the base website, adding authentication, etc.
At each major step, we worked on a structured specification, which I fed into Codex.
I tested the results and gave feedback to Codex.
Codex automatically adds unit tests, and uses them to give itself feedback - it is interesting to watch it attempting to fix its own mistakes, unprompted.

When problems occurred, I would often discuss these with ChatGPT before asking Codex to make changes.
For minor steps, I worked directly with Codex, with more of a simple trial and error approach.

The underlying PDF generation remains largely the original Perl script. The surrounding system - authentication, subscription handling, templating, validation and deployment - was almost entirely developed conversationally.


## The frustrations

There have been some frustrations.

At one point, what I thought was a simple change, resulted in a convoluted and entirely unjustified code change. This happened simply because I was not close enough to the JSON data being accessed, and Codex was trying to achieve something which normally I would have known was not possible.  I reverted the change, but not before it had used up my remaining Codex tokens.

Another issue was that, whilst complex changes were often completed quickly and efficiently, sometimes unbelievably trivial changes had us looping around in circles until I was forced to take control. Minor CSS positioning tweaks were a constant frustration.

We experienced a lot of 'mission creep' - it was just too tempting to extend the project, given that it wasn't me doing the hard work.  We should support Internet Calendars! We should have a weekly calendar format! We should have a daily planner format!  Quick and easy to type the commands into Codex, but the ensuing trial and error, added much to the length of the project.


## Conclusions

After many iterations and 'back to the drawing board' moments, we finally reached the point where it received spouse-approval, especially when she realised that next year she will be able to simply login and print.

The result is [MakeMyYear](https://makemyyear.com), a small subscription service that allows users to generate personalised downloadable calendars for £4 per year, which hopefully will offset some of the Codex costs, as well as giving me invaluable experience with working with Stripe.

I do feel it will be very difficult to go back to traditional coding. The line by line coding which I had always found so engaging, now seems like far too much like hard work!

Have I just spent months of free time and hard-earned money, simply making it possible for my wife to print her own calendars? Why yes, yes I have.
