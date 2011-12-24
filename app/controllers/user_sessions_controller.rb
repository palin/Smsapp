# -*- encoding : utf-8 -*-
class UserSessionsController < ApplicationController
  
  protect_from_forgery
  
  # before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
 public

  def new    
    @user_session = UserSession.new
  end
  
  def create    
    @user_session = UserSession.new(params[:user_session]) 
    if @user_session.save      
      flash[:notice] = 'Zalogowales sie'
      redirect_to home_index_path
    else      
      flash.now[:alert] = "Nieudane logowanie jako '#{params[:user_session][:login]}'"
      render :action => :new
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = 'Zostales wylogowany.'

    redirect_to root_path   
  end

end