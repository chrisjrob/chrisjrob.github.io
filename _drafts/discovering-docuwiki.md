--- 
layout: post 
title: Discovering Dokuwiki
date: 2015-11-30
type: post 
category: technology
tags: [linux, ubuntu, wiki, docuwiki]
image: dokuwiki.gif
---

I was looking for a Wiki for managing the sharing of a boat. 
What it looked like was incidental, but it needed to be really simple for users to edit pages quickly. 
I wanted to squeeze it onto a work server, so it needed to be really lightweight.

I have experience of using Wordpress and Drupal, but felt they were both too complex and too large for this use case.
I have also used MediaWiki in the past, but whilst easy to edit, I found it fairly cumbersome to use - it is afterall designed for managing vast sites.

In the end I opted for DokuWiki, after stumbling across a site that recommended it as a really simple alternative to MediaWiki. 

<!--more-->

Dokuwiki is really easy to install, with delightfully simple instructions for Apache.
I decided to use nginx as the web server, but could not immediately find [Instructions from DokuWiki], so instead followed these [Nginx Instructions] (Thank you RoseHosting).

On first attempt the page would not load, but the nginx logs were very clear and helpful in pointing me to increasing a value of `server_names_hash_bucket_size` in `/etc/nginx/nginx.conf`. 
This I found was commented out with a default of 32. I uncommented and increased to 64, and restarted nginx, navigated to the install page

Once installed and working perfectly, I decided to implement [Nginx Pretty URLs], which again worked perfectly. 




[Nginx Instructions]: https://www.rosehosting.com/blog/how-to-install-dokuwiki-on-debian-wheezy-with-nginx/
[Instructions from DokuWiki]: https://www.dokuwiki.org/install:nginx
[Nginx Pretty URLs]: https://www.dokuwiki.org/rewrite#nginx
