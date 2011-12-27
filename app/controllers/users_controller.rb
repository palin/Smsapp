class UsersController < ApplicationController
#before_filter :require_user

  DATA_ATTRS= [:name, :surname, :login, :email, :phone]

  def index
    @users = User.order(sort_column + " " + sort_direction)
  end

  def update    
    @user = current_user
    DATA_ATTRS.each do |attr|
      @user[attr] = params[attr] if params.has_key? attr
    end
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
