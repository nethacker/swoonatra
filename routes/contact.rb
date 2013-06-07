#License: (MIT), Copyright (C) 2013 Author Phil Chen.
#
get "/contact/?" do
  erb :contact
end

post '/contact' do

@contact = "#{params[:message]}  -- #{params[:name]}"

Pony.mail({
  :from => 'yourfrom@email.com',
  :to => 'yourto@email.com',
  :subject => 'Swoonatra Contact',
  :body => @contact,
  :via => :sendmail,
  :via_options => {
  :location  => '/usr/sbin/sendmail',
  :arguments => '-t'
  }
})
  redirect '/'
end
