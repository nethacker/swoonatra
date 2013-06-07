#License: (MIT), Copyright (C) 2013 Author Phil Chen.
not_found do
  erb :'404'
end

error do
  @error = request.env['sinatra_error'].name
  haml :'500'
end
