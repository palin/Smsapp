class UsersController < ApplicationController
#before_filter :require_user
  DATA_ATTRS= [:name, :surname, :login, :email, :phone, :password, :password_confirmation]

  def index
    @users = User.order(sort_column + " " + sort_direction)
  end

  def update
    data = []
    @user = current_user
    @user.attributes = params[:user]

    @user.save!
    redirect_to profile_edit_path
  end

  private

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "login"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
