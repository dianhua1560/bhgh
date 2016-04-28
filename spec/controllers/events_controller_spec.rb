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
		it 'uploads photo' do
			@event1.stub(:save).and_return(true)

			update_params = {
				avatar: "",
				id: @event1.id
			}
			post :update_photo, update_params
			response.should redirect_to('/') 
		end		
	end
end
##test bad update