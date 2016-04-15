class ForumController < ApplicationController
	def create_post
        if params[:body].present?
            if not params[:author].present? or not Member.is_email(params[:author])
                params[:author] = myEmail
            end
    		post = Post.new(post_params)
    		if post.save
    			response = post.post_responses.create(response_params)
    			render json: {:posts=>Post.list(myEmail), :post=>post.tojson(myEmail)}.to_json
    		else
    			render json: post.errors.to_json, status:400
    		end
        else
            render json: 'no body provided', status: 400
        end
	end
	
    def update_post
        post = Post.find(params[:id])
        if post.update(post_params)
            render json: post.tojson(myEmail).to_json, status:200
        else
            render json: post.errors.to_json, status:400
        end
    end
        
    def delete_post
        post = Post.find(params[:id])
        if post.author == myEmail or Member.is_admin_email(myEmail)
            post.destroy
            render nothing: true, status: 200
        else
            render json: 'cannot delete other peoples posts', status: 400
        end
    end

    def delete_response
        PostResponse.find(params[:id]).destroy
        render nothing: true, status: 200
    end

    def create_response
        post = Post.find(params[:id])
        if not params[:author].present?
            params[:author] = myEmail
        end
        response = post.post_responses.new(response_params)
        if response.save
            render json: {:post=> Post.find(params[:id]).tojson(myEmail) , :posts=>Post.list(myEmail)}, status: 200
        else
            render json: response.errors.to_json, status: 400
        end
    end

    def update_response
        response = PostResponse.find(params[:id])
        if response.update(response_params)
            render json: response.tojson(myEmail).to_json, status: 200
        else
            render response.errors.to_json, status: 400
        end
    end

    def list
        render json: Post.list(myEmail)
    end

    private
    def post_params
        params.permit(:author, :category, :title)
    end
    def response_params
        params.permit(:author, :response_type, :body)
    end
end
