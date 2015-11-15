--- 
layout: post 
title: Reasons For Migrating from Wordpress to Jekyll
date: 2015-11-15 15.45
type: post 
category: technology
tags: [jekyll, wordpress]
---

<img src="/assets/jekyll.png" class="image-right" alt="Jekyll icon">

Following my [recent announcement]({% post_url 2015-11-12-migration-wordpress-to-jekyll %}), I thought I would give some of my reasons for the move and some early impressions of using Jekyll. 


What is Jekyll?
---------------

[Jekyll] is a [Markdown] based website and blogging platform, written in Ruby. 
The principle is simple - you write markown text files and they are automatically converted to static HTML webpages.

<!--more-->

What is Markdown?
-----------------

I am assuming that most of my audience have at least a passing knowledge of [Markdown], but basically it is a very clean virtually syntax-free way of writing text files, so that they can be easily converted into different formats. 
The key to markdown is the conversion utility and I currently use [Pandoc]. 
I write the file once, and then I can convert into whatever format I want it in:

 * **PDF:** `pandoc -o sample.pdf sample.markdown`
 * **Word:** `pandoc -o sample.docx sample.markdown`
 * **HTML:** `pandoc -o sample.html sample.markdown`

I would imagine most people start using Markdown so that can continue to use the favourite text editor - Vim or Emacs. 
At work I have found myself using it in preference to a word-processor, I have written a simple `md2pdf` perl script, so that in vim I can simply type `:md2pdf %` to have my document saved as a PDF. 
And the PDFs that Pandoc produces are beautiful and headings and sub-headings are automatically converted into PDF Bookmarks, giving your documents an effortless professionalism.

For complicated documents are sometimes start in Markdown and then move to LaTeX, but increasingly I am finding myself able to do virtually everything in Markdown, including simple images and hyperlinks. 
But you also have the option of extending plain markdown with HTML tags.

So in simplest terms Jekyll is just an automated way of creating Markdown files and converting them to HTML.


But why change from Wordpress?
------------------------------

[Wordpress] has been great for me, it's relatively simple, has great statistical tools, a build in commenting system and much more besides. 
So why leave all that behind for something which is fundamentally so basic?

### Benefits of Jekyll

 1. **Text Editor:** Once again the desire to use [Vim] was probably the key motivation. 
 2. **Github Pages:** The fact that Jekyll could be used [with the free Github Pages][github] was another. 
 3. **Command Line:** The ability to use grep, sed and perl and all the other command line goodies makes for an incredibly versatile system.
 4. **Version Control:** To have the whole site under version control.

I cannot tell you how wonderful it is to `grep -l searchtext *.markdown | vim -` and be able to edit each matching file in Vim.

### Bootpolish Blog

There was another reason too, which was that I still had an old blog at bootpolish.net, which I wanted to close down. 
I could have merged it into my Wordpress blog, but I thought it would be easier to transfer it to Jekyll. 
To be honest I can't say that it was particularly easy, but thankfully it is now done.


The Migration Process
---------------------

I followed the [GitHub Instructions for Jekyll][github].
I used rsync to copy the underlying text files from Bootpolish.net into the _drafts folder, before using bash for loops to auto-process each into a Jekyll markdown post. 
I used the [Wordpress Importer] to transfer my Wordpress blog.
The importer did not work particularly well, so I ended up editing each file in turn.

I found there was some customisation required: 

 1. **Categories:** By default Jekyll has no Category pages, for example: http://chrisjrob.com/category/technology/
 2. **Tags:** By default Jekyll has no Tag pages, for example: http://chrisjrob.com/tag/3dmodel/ 
 3. **Wordpress RSS:** I wanted to maintain the existing feed locations, which required creation of various additional feeds.
 4. **Tag Cloud:** By default Jekyll has no tag cloud functionality, which I believe is crucial to a blog.
 5. **Site Search:** By default Jekyll has no site search. There are plug-ins, but these are not compatible with GitHub pages. For now I have used Google Custom Search, but it has not yet indexed the entire site.

I have written [a script to build all the tags and categories](https://github.com/chrisjrob/chrisjrob.github.io/blob/master/tagger), which is working well. 
I would like to integrate this into the git commit command somehow, so that I don't forget to run it!

Any new categories would require additional RSS feed files creating, by simply copying the feed template into the relevant category/feed folder.


Conclusions
-----------

This has been much more work than I would have liked. 
That said, I now have my Markdown files in a format under my control. 
I can move those files to any Jekyll provider, or indeed to any web provider and have them hosted.

In short, I am hoping that this is the last time I will move platforms!


[jekyll]: http://jekyllrb.com
[markdown]: http://daringfireball.net/projects/markdown/
[pandoc]: http://pandoc.org/
[dillinger]: http://chrisjrob.com/tag/markdown/
[wordpress]: http://wordpress.com
[vim]: http://www.vim.org
[github]: https://help.github.com/articles/using-jekyll-with-pages/
[wordpress importer]: http://import.jekyllrb.com/docs/wordpressdotcom/

