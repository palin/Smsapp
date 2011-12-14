# -*- encoding : utf-8 -*-
class UserSessionController < ApplicationController
  
  protect_from_forgery
  
  # before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
 protected

  def https_actions
    [:new, :create]  
  end
  
 public

  def new    
    @user_session = UserSession.new
  end
  
  def create    
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save      
      flash[:notice] = 'Zalogowales sie'
    else      
      flash.now[:alert] = "Nieudane logowanie jako '#{params[:user_session][:login]}'"
      render :action => :new
    end
  end
  
  def destroy
    flash[:notice] = 'Zostales wylogowany.'
    current_user_session.destroy
    redirect_back_or_default('/')    
  end

end