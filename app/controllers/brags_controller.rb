class BragsController < ApplicationController

	def list
		render json: Brag.list(myEmail)
	end

	def click
		render nothing: true, status: 200
	end


	def create_form
		brag = params[:brag]
		Brag.create!(
			title: brag[:title],
			subject: brag[:subject],
			author: brag[:author] ? brag[:author] : myEmail,
			avatar: brag[:avatar],
			body: brag[:body]
			)
		redirect_to '/'
	end

	def update_photo
		brag = Brag.find(params[:id])
		brag.avatar = params[:avatar]
		brag.save!
		redirect_to '/'
	end

	def delete_photo
		brag = Brag.find(params[:id])
		brag.avatar = nil
		brag.save!
		render json: {:brags => Brag.list(myEmail), :brag => brag.tojson(myEmail)}.to_json , status: 200
	end

	def create
		bragparams = params[:brag]
		brag = Brag.new(
			title: bragparams[:title],
			subject: bragparams[:subject],
			author: bragparams[:author] ? bragparams[:author] : myEmail,
			avatar: bragparams[:avatar],
			body: bragparams[:body]
			)
		if brag.valid?
			brag.save!
		else
			flash[:errors] = brag.errors.full_messages
      		flash[:object_params] = bragparams
      		flash[:error_type] = 'brag'
  		end
		redirect_to '/'
	end

	def update
		brag = Brag.find(params[:id])
		if brag.update(brag_params)
			render json: Brag.list(myEmail) #brag.tojson(myEmail), status: 200
		else
			render json: brag.errors.to_json, status: 400
		end
	end

	def delete
	  	Brag.find(params[:id]).destroy
	  	if request.get?
	  		redirect_to '/admin'
	  	else
	  		render json: Brag.list(myEmail), status: 200
	  	end
	end

	def like
		BragLike.where(email: myEmail).where(brag_id: params[:id]).first_or_create!
		render nothing: true, status: 200
	end

	def unlike
		BragLike.where(email: myEmail).where(brag_id: params[:id]).destroy_all
		render nothing: true, status: 200
	end




	 private

  def brag_params
    params.permit(:title, :author, :subject, :body)
  end




	

end
