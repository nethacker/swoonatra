#License: (MIT), Copyright (C) 2013 Author Phil Chen.
#
DataMapper.setup(:default, 'mysql://dbusername:dbpassword!@localhost/dbnamehere')

class Users 
  include DataMapper::Resource
  
  attr_accessor :password, :password_confirmation
  property :id,             Serial,   :unique => true
  property :created_at,     DateTime
  property :updated_at,     DateTime  
  property :email,          String,   :required => true, :unique => true, :format => :email_address
  property :password_hash,  Text
  property :password_salt,  Text
  property :token,          String

  validates_length_of           :password, :min => 6
end

class Profiles
  include DataMapper::Resource
  property :id,             Serial, :unique => true
  property :created_at,     DateTime
  property :updated_at,     DateTime
  property :name,           String
  property :location,       String
  belongs_to :users, :child_key => [:user_id], :constraint => :destroy
end

DataMapper.finalize

#UNCOMMENT IF YOU WANT TO CHANGE YOUR DB SCHEMA
#DataMapper.auto_upgrade!
#
#DONT UNCOMMENT UNLESS YOU WANT TO DELETE YOUR DATA UPON DB SCHEMA CHANGE
DataMapper.auto_migrate!
