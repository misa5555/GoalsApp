class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def login!(user)
    user.reset_session_token
    @current_user = user
    session[:session_token] = @current_user.session_token
  end
  
  def logout!
    current_user.reset_session_token
    session[:session_token] = nil
  end
  
  def signed_in?
    !!current_user
  end
  
  def require_user_login
    unless signed_in?
      flash[:errors] = ["you need to log in!"]
      redirect_to new_session_url
    end   
  end  
end
