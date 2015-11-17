--- 
layout: post 
title: Dillinger - The HTML5 Markdown Editor
date: 2014-08-09
type: post 
published: true 
status: publish
category: technology
tags: [linux, ubuntu, dillinger, markdown, review, web, vim]
image: dillinger.png
---

I thought I loved
[markdown](http://en.wikipedia.org/wiki/Markdown "Read about markdown on Wikipedia").
I thought [Dillinger](http://dillinger.io) (an HTML5 Markdown editor)
looked remarkable. So I downloaded and installed it on an Ubuntu 14.04.1
LTS server:

<!--more-->

    $ git clone https://github.com/joemccann/dillinger.git dillinger
    $ cd dillinger
    $ npm i -d
    $ mkdir -p public/files/{md,html,pdf}
    $ sudo apt-get install nodejs
    $ sudo ln -s /usr/bin/nodejs /usr/bin/node
    $ npm install express
    $ npm install phantomjs
    $ cd dillinger
    $ node app

It looks beautiful and works perfectly and even includes the ability to
export to PDF. But it seems that, for me at least, markdown without
[Vim](http://www.vim.org/) just isn't the same.

Shame that.

