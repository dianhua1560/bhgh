require 'rails_helper'

RSpec.describe BragsController, type: :controller do
	describe 'Brags API' do
		before :each do 
			request.cookies[:email] = 'admin1@gmail.com'
			@brag1 = Brag.create!(title: 'title1',
				subject: 'subject1@gmail.com',
				author: 'author1@gmail.com',
				body: 'body1')
			@brag2 = Brag.create!(title: 'title2',
				subject:'subject2@gmail.com',
				author:'author2@gmail.com',
				body:'body2')
		end
		it 'sends a list of brags' do
			get :list
			json = JSON.parse(response.body)
			expect(json.length).to eq(2)
		end

		it 'accepts posts to create brags' do
			brag_params = {
				title:'title3',
				author:'author1@gmail.com',
				subject:'subject@gmail.com',
				body:'body1'
			}
			post :create, brag_params
			expect(response).to be_success
		end

		it 'returns errors for bad new brags' do
			bad_brag_params = {
				title:'title3',
				author:'author1',
				subject:'subject@gmail.com',
				body:'body1'
			}
			post :create, bad_brag_params
			expect(response).to have_http_status(400)
		end

		it 'allows updating brags' do 
			update_params = {
				title:'new title',
				id: @brag1.id
			}
			post :update, update_params
			expect(response).to be_success
		end

		it 'returns errors for bad brag updates' do 
			bad_update_params = {
				title:'new title',
				subject:'subject_no_email',
				id: @brag1.id
			}
			post :update, bad_update_params
			expect(response).to have_http_status(400)
		end

		it 'allows admin to delete brags' do
			params = {id: @brag1.id}
			post :delete, params
			expect(Brag.all.length).to eq(1)
		end

		it 'shows brag modal' do
			params = {id: @brag1.id}
			get :modal_show, params
		end


	end
end
