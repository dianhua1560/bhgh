class ForumController < ApplicationController
	def create
		post = Post.new(
			title: params[:title],
			author: params[:author],
			category: params[:cateogry])
		if post.save
			response = post.post_responses.new(response_params)
			

			render json: post.to_json
		else
			render json: post.errors.to_json, status:400
		end
	end
end
