require 'rails_helper'

RSpec.describe EventsController, type: :controller do
	describe 'Events API' do
		before :each do 
			request.cookies[:email] = 'admin1@gmail.com'
			@event1 = Event.create!(
				title: 'title1',
				organizer: 'admin1@gmail.com',
				description: 'some description1',
				location: 'dummy location',
				time: Time.now)

		end
		# it 'uploads photo' do
		# 	# image = Rack::Test::UploadedFile.new(Rails.root.join('image.png'), 'image/png')
		# 	# image = Rack::Test::UploadedFile.new('spec/image.png', 'image/png')
		# 	# image = Rails.root.join('spec/fixtures/images/test.png')
		# 	# image = File.open('spec/image.png')
		# 	# EmpAttachment.create(picture: File.open("#{Rails.root}/spec/image.png"))
		# 	# image = File.open('spec/image.png')

		# 	image = fixture_file_upload('image.png', 'image/png')


		# 	update_params = {
		# 		avatar: image,
		# 		id: @event1.id
		# 	}
		# 	post :update_photo, update_params
		# 	# expect(response).to have_http_status(400)
		# 	response.should redirect_to('/') 
		# end


		
	end
end
##test bad update