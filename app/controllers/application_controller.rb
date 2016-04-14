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
    puts "path was #{request.path}"
    puts "params were#{request.params}"
    Click.create(
      email: myEmail,
      path: request.path,
      params: request.params)
  end

<<<<<<< HEAD

=======
  def board
    @events = Event.all
    @brags = Brag.all
    @items = @events + @brags
    @brag_ids = Brag.all.pluck(:id)
    @event_ids = Event.all.pluck(:id)
    print @brag_ids
    print @event_ids
    @items = @items.shuffle
    @posts = Post.all
    render 'layouts/board'
  end
>>>>>>> c4158865e780b8f02276eef1e77dab1263ef3959

  def home
    render 'layouts/home'
  end

  def board
<<<<<<< HEAD
    @events = Event.all.map{|x| x.tojson(myEmail)}.to_json
    @brags = Brag.all.map{|x| x.tojson(myEmail)}.to_json
    @posts = []
=======
    @events = Event.all.map{|x| x.tojson}.to_json
    @brags = Brag.all.map{|x| x.tojson}.to_json
    @items = Event.all.to_a + Brag.all.to_a
    @items = @items.sort_by{|x| x.sort_time}.map{|x| x.tojson}
    @items = @items.shuffle.to_json
    @posts = Post.all.map{|x| x.tojson}.to_json
>>>>>>> c4158865e780b8f02276eef1e77dab1263ef3959
    render 'layouts/board', layout: false
  end
end
