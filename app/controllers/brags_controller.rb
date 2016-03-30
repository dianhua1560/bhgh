class BragsController < ApplicationController
	def index
	    @brags = Brag.all.order('created_at desc')
	    @is_admin = current_member ? current_member.admin? : false
	    @photos = Brag.photo_hash
	end

	def show
		@brag = Brag.find(params[:id])
		@photos = Photo.where(object_type:'brag', object_id: @brag.id)
	end

	def new
		@brag = Brag.new
		render :edit
	end

	def edit
		@editing = true
		@brag = Brag.find(params[:id])
		@photo_urls = Photo.where(
			object_type: 'brag',
			object_id: @brag.id
			).map{|x| x.url}
		render :edit
	end

	def update
		# author title body subject
		if params[:id] and params[:id] != ''
            @brag = Brag.find(params[:id])
        else
            @brag = Brag.new
        end
        @brag.title = params[:title]
        @brag.author = params[:author] != '' ? params[:author] : myEmail
        @brag.subject = params[:subject]
        @brag.body = params[:body]
    	if @brag.save
	        Photo.where(
	        	object_type:'brag',
	        	object_id: @brag.id).destroy_all
	        params[:photos].split(',').each do |photo_url|
	        	Photo.where(
	        		object_type:'brag',
	        		object_id: @brag.id,
	        		url: photo_url.strip).first_or_create!
	        end
	        redirect_to brags_path
	    else
	    	@errors = true
	    	render :edit
	    end
	end

	def admin
		@brags = Brag.all.order('created_at desc')
		@click_hash = Brag.click_hash
	end

	def delete
		Brag.find(params[:id]).destroy
		redirect_to :back
	end

end
