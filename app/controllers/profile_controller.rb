class ProfileController < ApplicationController

  def edit
    @user = current_user
  end
  
end
