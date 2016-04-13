require 'rails_helper'

RSpec.describe EventsController, type: :controller do
	describe 'Events API' do
		before :each do 
			request.cookies[:email] = 'admin1@gmail.com'
			@event1 = Event.create!(
				title: 'title1',
				organizer: 'admin1@gmail.com',
				description: 'some description1',
				time: 'May 2')
		end

		it 'lists events' do 
			get :list
			expect(response).to be_success
		end
		
	end
end
