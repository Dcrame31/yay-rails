class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :require_login, :message
    
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to root_path
      end
    end

    def message(message)
      flash[:message] = message
    end
    
  end
