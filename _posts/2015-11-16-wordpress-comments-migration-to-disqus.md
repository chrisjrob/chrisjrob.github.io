--- 
layout: post 
title: Wordpress Comments Migration to Disqus
date: 2015-11-16 21:00:00
type: post 
category: technology
tags: [blog, jekyll, wordpress]
image: disqus-logo.png
---

I assumed that, when I [migrated from Wordpress to Jekyll]({% post_url 2015-11-12-migration-wordpress-to-jekyll %}), one of the casualties would be the old Wordpress comments. 
I had decided to use [DISQUS] for comments on Jekyll, partly because it is the "new thing" and partly because it is incredibly easy to achieve.
But I never for a moment considered that migrating the old comments would be a possibility.

<!--more-->

In fact, not only is it possible, but it is [almost trivially easy][import].

I did encounter a few issues, as I had foolishly renamed some pages to more logical names, thereby both breaking all Google and other links, but also breaking the link with DISCUS comments. That was a very bad idea and as a consequence I spent quite a while renaming files back again, but other than that it all worked flawlessly. If you are going to rename pages - probably best to do it in Wordpress before migrating to Jekyll.

Well done [DISCUS] for making something that you would expect to be difficult easy. And thank you [Wordpress] for providing a decent export routine, without which my data would have been locked away.

I look forward to your comments!

Chris.


[disqus]: http://disqus.com
[import]: https://help.disqus.com/customer/portal/articles/466255-importing-comments-from-wordpress
[wordpress]: http://wordpress.com
