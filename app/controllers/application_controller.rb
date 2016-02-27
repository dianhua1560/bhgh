class ApplicationController < ActionController::Base
  include AuthHelper
  before_filter :signed_in, :except => [:google_callback]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def signed_in
     if not myEmail
       session[:auth_redirect] = request.path
      redirect_to '/auth/google_oauth2'
    end
  end
end
