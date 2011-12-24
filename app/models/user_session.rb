# -*- encoding : utf-8 -*-
class UserSession < Authlogic::Session::Base

  find_by_login_method :find_by_login_or_email
  
  #generalize_credentials_error_messages true
  login_field :login
  password_field :password

  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end

end
