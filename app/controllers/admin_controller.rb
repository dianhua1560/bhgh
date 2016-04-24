class AdminController < ApplicationController
	def index
		@brags = Brag.all
		@events = Event.all
		@posts = Post.all
	end
end
