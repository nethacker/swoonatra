#License: (MIT), Copyright (C) 2013 Author Phil Chen.
get '/flash/?' do
  flash[:notice] = "Your Message Here!"
  erb :flash
end
