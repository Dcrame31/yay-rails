class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :require_login, :message, :admin?, :admin_access
    before_action :set_current_user
    
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def require_login
      unless logged_in?
        message("You must be logged in to access this section")
        redirect_to root_path
      end
    end

    def message(message)
      flash[:message] = message
    end
    
    def set_current_user
      User.current = current_user
    end

    def admin?
      current_user.admin
    end

    def admin_access
      unless logged_in? && current_user
        message("You must be an admin to access this information.")
        redirect_to root_path
      end
    end

    
  end
