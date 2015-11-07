---
layout: page
title: Howto | Install Ruby on Rails3 on Debian Lenny
menu: howto
weight: 40
category: technology
tags: [linux, debian, ispconfig, apache, ruby]
---

## Warning

I know nothing about Ruby on Rails, but this is how I ended up successfully (I think!) installing it.  There may be better ways.

## Download and Compile Ruby

At the time of writing, the current version is 1.9.2

   * http://www.ruby-lang.org/en/downloads/

I tend to use checkinstall wherever possible, so that I can manage the package via apt-get and dpkg.

    $ sudo apt-get install checkinstall

    $ wget ftp://ftp.ruby-lang.org//pub/ruby/1.9/ruby-1.9.2-p0.tar.gz
    $ tar -xvvzf ruby-1.9.2-p0.tar.gz
    $ cd ruby-1.9.2-p0

    $ ./configure
    $ make
    $ sudo checkinstall

Set the version number to 1.9.2

## Install Rails

    $ sudo gem install rails

## Install Passenger

**This assumes you are using apache2.**

    $ sudo gem install passenger
    $ sudo passenger-install-apache2-module

Please read thoroughly the output from this the last command, as it will give you the information you require for the next section.

## Enable Passenger

    $ cd /etc/apache2/mods-available

Create or edit the following files, using the output from passenger-install-apache2-module above.

### passenger.conf

    <IfModule mod_passenger.c>
        PassengerRoot /usr/local/lib/ruby/gems/1.9.1/gems/passenger-2.2.15
        PassengerRuby /usr/local/bin/ruby
    </IfModule>

### passenger.load

    LoadModule passenger_module /usr/local/lib/ruby/gems/1.9.1/gems/passenger-2.2.15/ext/apache2/mod_passenger.so

### Enable in Apache

You should now be able to enable the apache module with:

    $ sudo a2enmod passenger

## Update Vhosts

This will vary depending on your system, but you are aiming to have a vhost configuration similar to the following:

    <VirtualHost *:80>
        ServerName www.yourhost.com
        DocumentRoot /somewhere/public    # <-- be sure to point to 'public'!
        RailsEnv development              # <-- change to testing/production as appropriate (see note below)
        RackEnv development               # <-- change to testing/production as appropriate (see note below)
        <Directory /somewhere/public>
           AllowOverride all              # <-- relax Apache security settings
           Options -MultiViews            # <-- MultiViews must be turned off
        </Directory>
    </VirtualHost>

By default, passenger uses the Ruby on Rails production database, which may or may not be appropriate, depending on where you are in the development process.  If you are still developing your rails app, then you may want to set in the above:

    RailsEnv development
    RackEnv development

In theory you only need the former, but the presence of the file config.ru in your application directory makes passenger require RackEnv instead.

Otherwise, when making changes to your database, do remember to:

    # db:migrate RAILS_ENV=production
    # touch tmp/restart.txt

Otherwise your application will not work.

## ISPConfig

If you are using ISPConfig, then I currently have this working by adding the following to the sites Apache Directives in the admin control panel:

    DocumentRoot /var/www/web11/web/blog/public
    <Directory /var/www/web11/web/blog/public>
        AllowOverride all
        Options -MultiViews
    </Directory>

And then edit `/etc/apache2/vhosts/Vhosts_ispconfig.conf` and remove the old DocumentRoot line from the relevant vhost section.  Unfortunately you will have to do this everytime you change your site configuration.  This is very poor, there has to be a better way.

## Installing JQuery

These are rather poor notes, you are probably better looking elsewhere, but the key thing is that the long and complex instructions for installing jquery that abound on the Internet should be avoided.  The installation should be a mere couple of commands.

Either type:

    $ gem install jquery-rails

Or as I preferred, edit your Gemfile (in the root of your rails project) and add:

    gem 'jquery-rails'

My handwritten notes don't say this, but I believe you would then need to run:

    $ bundle install

And then (add "--ui" on the end of the following command to include the jquery UI):

    $ rails generate jquery:install

