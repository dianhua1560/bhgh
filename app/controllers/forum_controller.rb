class ForumController < ApplicationController

    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            render json: post.to_json, status:200
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

    def response_params
        params.permit(:author, :response_type, :body, :post_id)
    end

    def response_create
        post = Post.find(params[:id])
        response = post.post_responses.do_new(response_params)
        if response.save
            render json: post_responses.to_json, status: 200
        else
            render json: post_responses.errors.to_json, status: 400
        end
    end

    def response_update
        response = Post_Response.find(params[:id])
        if response.update(response_params)
            render json: post_responses.to_json, status: 200
        else
            render post_responses.errors.to_json, status: 400
        end
    end

    def list
        render json: Post.all.map{|x| x.to_json}
    end
end





