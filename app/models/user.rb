class User < ActiveRecord::Base
	acts_as_authentic
	
	validates_presence_of :login, :email
	before_save :encrypt_password, :only => :create

	def self.find_by_login_or_email login
    self.first :conditions => ["LOWER(login) = :login OR LOWER(email) = :login", {:login => login.downcase}]
  	end  
end
