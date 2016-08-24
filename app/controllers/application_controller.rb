class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  
  #after_action :verify_authorized, except: :index
  #after_action :verify_policy_scoped, only: :index
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private #--------------------------------------------------------

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || new_user_session_path)
  end

  
end
