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
		before(:each) do
			h = Hash.new
			h['email'] = 'davidbliu@gmail.com'
			h2 = Hash.new
			h2['info']=h
			request.env["omniauth.auth"] = h2
		end
		it 'redirects' do
			session[:auth_redirect] = '/asdf'
			get :google_callback
			expect(response).to redirect_to '/asdf'
		end
		it 'redirects without session' do
			get :google_callback
			expect(response).to redirect_to '/'
		end
	end
end