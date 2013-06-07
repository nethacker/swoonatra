SWOONATRA
=========
License: (MIT) Copyright (C) 2013 Phil Chen.

-DESCRIPTION:

A Template To Show Ruby Sinatra Functionality And Quickly Get Started on a Project

This project was made to save time in learning Sinatra by seeing some examples and having a template to work from.
This is not a repalcement for reading the Sinatra or other gem documenation but to help provide examples and
a structure.

The code covers usages of DataMapper an Object Relational Mapper written in Ruby using MySQL with a foreign key
relationship. Also user signup, signin, password reset, session handling. For design the code shows usage of
url routing, views, partial views, layouts, error handling, flash messaging. Also included is samples of emailing data,
and there is a basic Unicorn web server configuration. Everything is layed out with a MVC structure. Hope this helps!

-PREREQUISITE / WORKS WITH:

RUBY:

ruby 1.9.3p392 (2013-02-22 revision 39386) [x86_64-linux]

RUBY GEMS:

sinatra (1.4.2)
unicorn (4.6.2)
data_mapper (1.2.0)
bcrypt-ruby (3.0.1)
pony (1.4.1)
sinatra-flash (0.3.0)

DATABASE:

MySQL

-STRUCTURE:

app.rb
config.ru
unicorn.conf

helpers --> init.rb
        --> helpers.rb

model   --> init.rb
        --> model.rb

routes --> init.rb
       --> contact.rb
       --> error.rb
       --> flash.rb
       --> index.rb
       --> multipath.rb
       --> user.rb

views  --> 404.erb
       --> contact.erb
       --> custom_layout.erb
       --> flash.erb
       --> general_layout.erb
       --> index.erb
       --> join.erb
       --> login.erb
       --> partial.erb
       --> passwordrequest.erb

public  --> css
            \--> style.css
        --> images
        --> javascript
            \--> jquery-1.10.0.min.js

unicorn --> log
        --> pids
        --> sockets
