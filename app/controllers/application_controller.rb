class ApplicationController < ActionController::Base
  include AuthHelper
  before_filter :signed_in, :except => [:google_callback]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  def signed_in
    if not myEmail
      session[:auth_redirect] = request.path
      redirect_to '/auth/google_oauth2'
    else
      log_click
    end
  end

  def log_click
    Click.create(
      email: myEmail,
      path: request.path,
      params: request.params)
  end

  def board
    # validation stuff
    @errors = flash[:errors].to_json
    @params = flash[:object_params].to_json
    @error_type = flash[:error_type]
    @searching = false

    @events = Event.all.map{|x| x.tojson(myEmail)}.to_json
    @brags = Brag.all.order('created_at desc').map{|x| x.tojson(myEmail)}.to_json
    @posts = Post.all.map{|x| x.tojson(myEmail)}.to_json
    @maps_api_key = ENV['MAPS_API_KEY']
    render 'layouts/board', layout: false
  end
end
