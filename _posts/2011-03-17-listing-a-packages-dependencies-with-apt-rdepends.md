--- 
layout: post 
title: Listing A Packages Dependencies With apt-rdepends
date: 2011-03-17
type: post 
published: true 
status: publish
category: technology linux
tags: cli
---

I sometimes find myself wondering what a package's dependencies are.
This question is usually quickly satisfied with a
`$ sudo apt-get install packagename` and then aborting, or perhaps more
elegantly `$ sudo apt-get -s install packagename` to simulate the
installation.

<!--more-->

This doesn't give you the entire picture, as it only lists the
dependencies that you don't already have; which is usually all you care
about, but there are occasions when you would like to list all of a
package's dependencies, for example when planning for a system that is
not built yet, or not accessible at the current time. Or just for idle
curiosity! Perhaps that's just me.

Anyhow, `apt-rdepends` is the application for the job. It doesn't just
list the package's dependencies, but it recursively goes through each
dependency's dependencies.

Install it with the usual `$ sudo apt-get install apt-rdepends` and then
simply run with:

    $ apt-rdepends packagename | less

Yes, it is quite verbose, hence the "| less" - leave it out if you
prefer, or use "| more" which is more likely to be installed on your
system (tip: install "less" - less is better than more, if that makes
any sense).

For example, I had just installed "flite" and was amazed at how
functional it was. I wondered to myself whether it was just a front-end
to festival - but how to find out?

    $ apt-rdepends flite

Which comes back with no other speech synthesis engine (e.g. festival),
so clearly flite is a speech synthesis engine in its own right.

