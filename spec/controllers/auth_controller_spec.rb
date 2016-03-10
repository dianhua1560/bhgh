require 'spec_helper'
require 'rails_helper'

describe AuthController do
	describe 'logout method' do
		it 'redirects to google' do
			get :logout
			expect(response).to redirect_to("https://accounts.google.com/logout")
		end
	end
end