class ForumController < ApplicationController
	def list
		render json: Post.all.map{|x| x.to_json}
	end
end
