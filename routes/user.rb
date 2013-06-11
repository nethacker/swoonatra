#License: (MIT), Copyright (C) 2013 Author Phil Chen.
#
get "/join/?" do
  erb :join, :layout => :general_layout
end

post "/join" do
  user = Users.new(params[:user])
  user.password_salt = BCrypt::Engine.generate_salt
  user.password_hash = BCrypt::Engine.hash_secret(params[:user][:password], user.password_salt)
  user.token = SecureRandom.hex

  if user.save
  
  userid = Users.last

  else
    redirect "/join?email=#{params[:user][:email]}"
  end

  profile = Profiles.new
  profile.user_id = userid.id

  if profile.save
    session[:user] = user.id
    flash[:notice] = "Welcome to the Family"
    redirect "/" 
  else
    redirect "/join?email=#{params[:user][:email]}"
  end
end

get "/login/?" do
  if current_user
    redirect "/"
  else
  erb :login
  end
end

post "/login" do
    if user = Users.first(:email => params[:email])
    if user.password_hash == BCrypt::Engine.hash_secret(params[:password], user.password_salt)
    session[:user] = user.id
    redirect "/"
    else
      redirect "/login?email=#{params[:email]}"
    end
  end
end

get "/password-request/?" do
  erb :passwordrequest
end

post "/password-request" do

if user = Users.first(:email => (params[:email]))
@reset_path = "http://yourhostname/reset?email=#{params[:email]}"

Pony.mail({
  :from => 'from@email.com',
  :to => (params[:email]),
  :subject => 'Password Reset Request',
  :body => "Click to Reset Your Password: #{@reset_path}",
  :via => :sendmail,
  :via_options => {
  :location  => '/usr/sbin/sendmail',
  :arguments => '-t'
  }
})

    redirect '/'
else
    redirect "/password-request?email=#{params[:email]}"
  end
end

get "/reset" do

  user = Users.first(:email => (params[:email])) 
  @random_password = (0...8).map{(65+rand(26)).chr}.join
  @salt = BCrypt::Engine.generate_salt

  user.update(:password_hash => BCrypt::Engine.hash_secret(@random_password, @salt))
  user.update(:password_salt => @salt)

Pony.mail({
  :from => 'from@email.com',
  :to => (params[:email]),
  :subject => 'Your Password',
  :body => "Your New Password: #{@random_password}",
  :via => :sendmail,
  :via_options => {
  :location  => '/usr/sbin/sendmail',
  :arguments => '-t'
  }
})
  
  redirect "/"
end

get "/logout/?" do
  session[:user] = nil
  redirect "/"
end
