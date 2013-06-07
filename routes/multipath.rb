#License: (MIT), Copyright (C) 2013 Author Phil Chen.
#
["/phil", "/john", "/bob"].each do |path|
  get path do
    "You have reached me at #{request.path_info}"
  end
end
