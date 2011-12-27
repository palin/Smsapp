class UsersController < ApplicationController
#before_filter :require_user

  DATA_ATTRS= [:name, :surname, :login, :email, :phone]

  def index
    @users = User.order(sort_column + " " + sort_direction)
  end

  def update    
    @user = current_user

    @user.name = params[:user][:name]
    @user.surname = params[:user][:surname]
    @user.login = params[:user][:login]
    @user.email = params[:user][:email]
    @user.phone = params[:user][:phone]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    @user.save!
    redirect_to profile_edit_path
    flash[:notice] = "Profile updated"
  end

  private

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "login"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
