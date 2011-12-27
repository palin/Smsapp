class UsersController < ApplicationController
#before_filter :require_user

  DATA_ATTRS= [:name, :surname, :login, :email, :phone]

  def index
    @users = User.order(sort_column + " " + sort_direction)
    @new_user = User.new
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

  def create   
    @user = User.new

    @user.name = params[:user][:name]
    @user.surname = params[:user][:surname]
    @user.login = params[:user][:login]
    @user.email = params[:user][:email]
    @user.phone = params[:user][:phone]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    @user.save!
    redirect_to users_path
    flash[:notice] = "User created"
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      UserSession.find.destroy
      @user.destroy
      redirect_to root_path
    else
      @user.destroy  
      redirect_to users_path
      flash[:notice] = "User deleted"
    end
  end

  private

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
