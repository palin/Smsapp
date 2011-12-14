class User < ActiveRecord::Base

	validates_presence_of :login, :password, :email

	def self.find_by_login_or_email login
    self.first :conditions => ["LOWER(login) = :login OR LOWER(email) = :login", {:login => login.downcase}]
  	end  
end
