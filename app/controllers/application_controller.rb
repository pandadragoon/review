class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :admin?

  def current_user
    @current ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "Must be logged in to do that."
      redirect_to root_path
    end
  end
  def admin?
    if current_user.role == 'admin'
      true
    else
      false
    end
  end
  def require_admin
    if current_user.role != 'admin'
      flash[:error] = "You don't have permission to do that."
      redirect_to root_path
    end
  end
end
