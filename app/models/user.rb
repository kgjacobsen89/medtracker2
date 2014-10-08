class User < ActiveRecord::Base
	include ActiveModel::SecurePassword
  	has_secure_password
  	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message => 'Please enter a vaild email'
  	validates :phone, 
  		:presence => {:message => 'Please enter a valid phone number'},
      :numericality => true,
      :length => { :minimum => 10, :maximum => 15 }

end
