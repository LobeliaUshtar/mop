class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def set_session_url
      session[:intended_url] = request.url
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def require_signin
      unless current_user
        set_session_url
        flash[:alert] = "Please sign in first!"
        redirect_to new_session_url
      end
    end

    def current_user?(user)
      current_user == user
    end
    helper_method :current_user?

    def current_user_approved?
      current_user && current_user.approved?
    end
    helper_method :current_user_approved?

    def current_user_admin?  
      current_user && current_user.admin?
    end
    helper_method :current_user_admin?

    def require_admin
      unless current_user_admin?
        set_session_url
        flash[:alert] = "Unauthorized access!"
        redirect_to root_url
      end
    end
  # private end
end