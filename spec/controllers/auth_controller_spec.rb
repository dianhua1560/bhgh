require 'spec_helper'
require 'rails_helper'

describe AuthController do
	describe 'logout method' do
		it 'redirects to google' do
			get :logout
			expect(response).to redirect_to("http://test.host/auth/google_oauth2")
		end
	end
	describe 'google callback' do
		it 'sets email cookie' do
			request.env = {
				'omniauth.auth':{
					'info':{
						'email': 'asfd'
					}
				}
			}
			get :google_callback
		end
	end
end