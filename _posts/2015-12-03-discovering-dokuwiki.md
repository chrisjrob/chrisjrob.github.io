--- 
layout: post 
title: Discovering Dokuwiki
date: 2015-12-03 10:15:00
type: post 
category: technology
tags: [linux, ubuntu, wiki, dokuwiki]
image: dokuwiki.gif
---

I was looking for a Wiki for managing the sharing of a boat, including booking usage, task lists and maintenance, as well as acting as a repository for any-and-all information available. 

What it looked like was incidental, but it needed to be really simple for users to edit pages quickly. 
I wanted to squeeze it onto a work server, so it also needed to be really lightweight.

<!--more-->

The Choices
-----------

I have experience of using both [Wordpress] and [Drupal], but felt they were too complex and cumbersome for this use-case.
I have also used [MediaWiki] in the past but, whilst easy to edit, I found it fairly cumbersome to use - it is after all designed for managing vast sites.

In the end I opted for [DokuWiki], after stumbling across a site that recommended it as a really simple alternative to MediaWiki. 


Installing DokuWiki
-------------------

Dokuwiki is really easy to install, with [delightfully simple instructions for Apache], but following my lightweight wishes I decided to try [Nginx] for the first time.
Unfortunately I could not immediately find [Nginx Instructions from DokuWiki], so instead followed these [Nginx Instructions] from Rose Hosting.

On first attempt the landing page would not load, but the nginx logs were very clear and helpful in pointing me to increasing a value of `server_names_hash_bucket_size` in `/etc/nginx/nginx.conf`. 
This I found was commented out (with a default of 32), so I uncommented it and increased it to 64 and restarted nginx. 
At last I could reach the install page and from that point it all worked perfectly.

Later I decided to implement [Nginx Pretty URLs], which again worked perfectly. 


First Impressions
-----------------

The main thing I love about DokuWiki is the simplicity. 

Creating users is trivial, creating and editing pages is a doddle, there is a reasonably sane way of managing media files, and the Wiki syntax is bearable (not Markdown sadly).

Despite this simplicity, each time I have come across something I'd like to tweak, then there has been a way to do it without resorting to nasty hacks.
Where Plugins are required, these can be installed in seconds via the web interface.

Most of what I was trying to do with this boat site was simply a matter of creating pages, but I did come across a few exceptions:

### Checklists

<img src="/assets/dokuwiki-checklists.png" class="image-left" alt="Example of Checklists">

One of the key uses for the site is to host a number of checklists, but I wanted tickboxes against each item. 
Not essential clearly, but it turned out to be trivial, simply deciding how to type a tickbox, e.g. square brackets for incomplete `[]` and `[x]` for complete, and then adding [DokuWiki Entities] to convert these into the appropriate character.


### Bookings

<img src="/assets/dokuwiki-edittable.png" class="image-right" alt="Edit-table Plugin">

The main problem that I faced was how to enable boat users to book time on the boat and in the end I settled on using simple text tables, but to make them simpler to edit I added Andreas Gohr's excellent [Edittable Plugin].
This plug-in is so good that I would always install it in any DokuWiki that will have tables.

Whilst this will certainly do for now, I am on the look out for some sort of site to manage bookings properly - if you know of anything suitable please do comment below, otherwise at some point I will probably write one in [Perl Dancer]!


Conclusions
-----------

Under the Use Cases on the [DokuWiki] website there is the suggestion of using it for a Private Notebook - having used DokuWiki I can totally see how that would make sense - it is *that* simple to create and edit.

[DokuWiki] has definitely filled a gap in my web toolbox, alongside [Perl Dancer] and [Jekyll].


[DokuWiki]: https://www.dokuwiki.org/
[DokuWiki Entities]: https://www.dokuwiki.org/entities
[Drupal]: http://drupal.org/
[Edittable Plugin]: https://www.dokuwiki.org/plugin:edittable
[Nginx Instructions from DokuWiki]: https://www.dokuwiki.org/install:nginx
[MediaWiki]: http://mediawiki.org/
[Nginx Instructions]: https://www.rosehosting.com/blog/how-to-install-dokuwiki-on-debian-wheezy-with-nginx/
[Nginx Pretty URLs]: https://www.dokuwiki.org/rewrite#nginx
[Perl Dancer]: http://perldancer.org/
[WordPress]: http://wordpress.org/
[delightfully simple instructions for Apache]: https://www.dokuwiki.org/install:ubuntu
[nginx]: https://www.nginx.com/

