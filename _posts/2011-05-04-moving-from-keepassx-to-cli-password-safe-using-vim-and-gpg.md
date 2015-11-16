--- 
layout: post 
title: Moving From Keepassx To CLI Password Safe Using Vim And GPG
date: 2011-05-04
type: post 
published: true 
status: publish
category: technology
tags: [linux, password, gpg, keepassx]
image: vim_logo.png
---

The more that I work from the command line, the more of a nuisance I
find it that all my passwords are in
[KeePassX](http://www.keepassx.org "KeePassX") - an excellent GUI
application.

For some time I have intended moving to pwsafe, but am put off by the
time it will take to migrate the data. An alternative is to export the
KeePassX data into an encrypted text file and use the `gnupg.vim` Vim
plugin to read and edit it. This post describes how to accomplish this
in a very few steps.

<!--more-->

I first ran KeePassX and deleted the backup group (as I did not wish to
export all my previous generations of passwords). I then exported the
contents to a text file named "passwords" (you could be more
imaginative/secure if you wish!). Then I followed 
[these instructions](http://awesometrousers.net/post/vim-with-gpg-file-encryption/)
to create a GPG secured file:

    $ gpg -c --cipher-algo AES256 passwords

And enter your secure passphrase twice. You should now have a new
password file "passwords.gpg". You can now remove the plain text
version:

    $ shred --remove passwords

In order to edit/view the new passwords.gpg file, we need the Vim
gnupg.vim plugin, which is available in the debian vim-scripts package:

    $ sudo apt-get install vim-scripts

Then edit `/etc/vim/vimrc.local` to add the following line:

    set runtimepath+=/usr/share/vim-scripts/

This will import all of the vim-scripts plugins, which may not be what
you want. Alternatively you could probably just copy or perhaps symlink
the gnupg.vim plugin to your `~/.vim/plugin/` folder.

And that is it - now whenever you wish to view or edit your passwords
you simply type:

    $ vim passwords.gpg

This will prompt you for your password and open the file.

Initially I found this gave errors in relation to `exuberant ctags`,
which I suspect is related to vim-scripts and not to gnupg.vim and is
doubtless a feature of the way I have just pulled in all of the
vim-scripts. One option (and what I did) is just to install
exuberant-ctags as follows:

    $ sudo apt-get install exuberant-ctags

Now I just have to format passwords.gpg into something a bit more
structured, perhaps with Vim folding configured.

And if you are looking for a way to create passwords, the pwgen is one
option - it offers a selection of fairly memorable passwords from which
to choose.

    $ sudo apt-get install pwgen

There are some concerns with this approach - anyone can read your
passwords over your shoulder - if you work with others you might be
better off with something like pwsafe. Also some users are concerned
that the contents of the file might be written to memory, although I
believe this is not the case, you should satisfy yourself as to the
security of this approach, as I am certainly not qualified to advise you
on this aspect.

