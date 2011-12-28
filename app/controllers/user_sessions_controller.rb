# -*- encoding : utf-8 -*-
class UserSessionsController < ApplicationController
  
  protect_from_forgery
  
  # before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
 public

  def new    
    if current_user.present?
      redirect_to home_index_path
    else
      @user_session = UserSession.new
    end
  end
  
  def create    
    @user_session = UserSession.new(params[:user_session]) 
    if @user_session.save      
      flash[:notice] = 'Logged in'
      redirect_to home_index_path
    else      
      flash[:notice] = "Logging failed"
      redirect_to root_path
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = 'User logged out'

    redirect_to root_path   
  end

end