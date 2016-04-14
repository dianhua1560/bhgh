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
	
    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            render json: post.tojson, status:200
        else
            render post.errors.to_json, status:400
        end
    end

    def post_params
        params.permit(:author, :category, :title)
    end
        
    def delete
        post = Post.find(params[:id])
        render nothing: true, status: 200
    end

    def response_create
        post = Post.find(params[:id])
        response = post.post_responses.new(response_params)
        if response.save
            render json: response.to_json, status: 200
        else
            render json: response.errors.to_json, status: 400
        end
    end

    def response_update
        response = PostResponse.find(params[:id])
        if response.update(response_params)
            render json: response.to_json, status: 200
        else
            render response.errors.to_json, status: 400
        end
    end

    def list
        render json: Post.all.map{|x| x.tojson}
    end

    def modal_show
        @post = Post.find(params[:id])
    end

    private
    def response_params
        params.permit(:author, :response_type, :body)
    end
end





