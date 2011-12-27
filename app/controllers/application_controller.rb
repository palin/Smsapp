# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user_session, :current_user, :logged_in?, :authorized?, :login_required, :admin_required, :superadmin_required, :access_denied, :current_company_or_user

  def set_request_current_user
    User.current_user = current_user if logged_in?
  end

  def permission_denied
   flash[:alert] = "Nie masz praw dostępu do tej strony."
   redirect_to login_path
  end

  def https_check
    return true 

    begin
      uri = URI.parse(request.url.strip)
    rescue URI::InvalidURIError
      redirect_to root_url and return
    end
    redirect_to root_url and return if uri.nil?
    unless uri.scheme == correct_scheme
      uri.scheme = correct_scheme
      redirect_to uri.to_s
    end
  end

  def text_with_sex(man, woman, orginal = nil, user = current_user)
    if user
      if user.k?
        return woman
      elsif user.m?
        return man
      end
    end
    return orginal || man
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end


  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged"
      redirect_to login_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must log out"
      redirect_to root_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default, options = {})
    redirect_to (session[:return_to] || default), options
    session[:return_to] = nil
  end

  def current_company
    current_user.try(:company)
  end

  def current_company_or_user
    current_company || current_user
  end

  def logged_in?
    !!current_user
  end

  def authorized?(action = action_name, resource = nil)
    logged_in?
  end

  def login_required
    authorized? || access_denied
  end

  def admin_required
    (authorized? and (current_user.admin? || current_user.superadmin?)) || access_denied
  end

  def superadmin_required
    (authorized? and current_user.superadmin?) || access_denied
  end

  def access_denied
    flash[:alert] = 'You must log in to access this page'
    respond_to do |format|
      format.html do
        redirect_to login_path
      end
      format.xml do
        session[:return_to] = request.referer
        render :template => 'layouts/redirect', :layout => 'taconite', :locals => { :url => new_session_url }
      end
      # format.any doesn't work in rails version < http://dev.rubyonrails.org/changeset/8987
      # Add any other API formats here.  (Some browsers, notably IE6, send Accept: */* and trigger
      # the 'format.any' block incorrectly. See http://bit.ly/ie6_borken or http://bit.ly/ie6_borken2
      # for a workaround.)
      format.any(:json) do
        request_http_basic_authentication 'Web Password'
      end
    end
  end
end
