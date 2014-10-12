class User < ActiveRecord::Base
	include ActiveModel::SecurePassword
  	has_secure_password
  	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message => 'Please enter a vaild email'
  	validates_format_of :phone_number, :with => /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, :on => :create, :message => 'Please enter a vaild phone number'

end
