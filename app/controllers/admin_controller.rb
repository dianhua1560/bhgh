class AdminController < ApplicationController
	before_filter :is_admin

	 def is_admin
        q = Member.where(email: myEmail)
        if q.length == 0 or not q.first.admin?
            render json: 'not authorized', status: 200
        end
    end
    
	def index
		@brags = Brag.all
		@events = Event.all
		@posts = Post.all
	end
end
