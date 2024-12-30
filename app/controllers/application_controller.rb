class ApplicationController < ActionController::Base
  include Authentication
  include SessionsHelper
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :require_authentication

  # Add current_user method to retrieve the current logged-in user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
