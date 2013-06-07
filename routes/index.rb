#License: (MIT), Copyright (C) 2013 Author Phil Chen.
get '/' do
  @time = "#{Time.now}"
  erb :index, :layout => :general_layout
end
