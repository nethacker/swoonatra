#License: (MIT), Copyright (C) 2013 Author Phil Chen.
require 'sinatra'

#set :environment,  :production
set :environment, :development
disable :run

configure do
  enable :sessions
  set :session_secret, ENV["SESSION_KEY"] || 'too secret'
end

require './app.rb'

run Sinatra::Application
