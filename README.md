SWOONATRA
=========
License: (MIT) Copyright (C) 2013 Phil Chen.

-DESCRIPTION:

A Template To Show Ruby Sinatra Functionality And Get You Quickly Started on a Project

This project was made to save time in learning Sinatra by seeing some examples and having a template to work from.
This is not a replacement for reading the Sinatra or other gem documentation but to help provide examples and
a structure.

The code covers usages of DataMapper an Object Relational Mapper written in Ruby using MySQL with a foreign key
relationship. Also user signup, signin, password reset, session handling. For design the code shows usage of
url routing, views, partial views, layouts, error handling, flash messaging. Also included is samples of emailing data,
and there is a basic Unicorn web server configuration. Everything is laid out with a MVC structure. Hope this helps!

How To Blog: http://www.philchen.com/2013/06/14/how-to-make-a-ruby-web-application-using-sinatra-with-the-help-of-swoonatra

-PREREQUISITE / WORKS WITH:

RUBY:

ruby 1.9.3p392 (2013-02-22 revision 39386) [x86_64-linux]

RUBY GEMS:

sinatra (1.4.2)
unicorn (4.6.2)
data_mapper (1.2.0)
dm-mysql-adapter (1.2.0)
bcrypt-ruby (3.0.1)
pony (1.4.1)
sinatra-flash (0.3.0)

DATABASE:

MySQL and MySQL-Devel: Just need a database and user with access.


-STRUCTURE:

    app.rb
    config.ru
    unicorn.conf
    helpers
    model
    routes
    views
    public
    unicorn
    
-NOTES:

 You will want to clone this to your server install the prerequisites and change a few things below:
 
-In the model directory you will want to edit the model.rb file to include your dbuser/password and dbname at the top
 also Uncomment DataMapper.auto_migrate! on first start of your Unicorn server to create the DB then comment that line
 out again.

-In the routes directory you will want to edit the user.rb file change the @reset_path to have your hostname of your
 server. Also under the Pony.mail setting change the from email to yours there are two places for that.

-In the routes directory you will want to edit the contact.rb file under Pony.mail settings change the from email to
 yours.
 
-To start unicorn go into the root of the directory of Swoonatra and use this command: unicorn -c unicorn.conf -D

-When you make changes to the routes you will need to killall unicorn and issue the start command again to see them

