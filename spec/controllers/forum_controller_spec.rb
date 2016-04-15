require 'rails_helper'

RSpec.describe ForumController, type: :controller do
	describe 'Post API' do
		before :each do 
			request.cookies[:email] = 'admin1@gmail.com'
			@post1 = Post.create!(title: 'title1',
				author: 'author1@gmail.com')
			@post2 = Post.create!(title: 'title2',
				author:'author2@gmail.com')
		end

		it 'sends a list of posts' do
			get :list
			json = JSON.parse(response.body)
			expect(json.length).to eq(2)
		end

		it 'accepts posts to board' do
			post_params = {
				title: 'title1',
				author: 'author1@gmail.com', 
				response_type: 'Question', 
				body: 'None'
			}
			post :create_post, post_params
			expect(response).to be_success
		end

		it 'returns errors for bad new posts' do
			bad_post_params = {
				title: 'title1',
				author: 'author1', 
				body: 'None'
			}
			post :create_post, bad_post_params
			expect(response).to have_http_status(400)
		end

		it 'allows updating posts' do 
			update_params = {
				title:'new title',
				id: @post1.id
			}
			post :update_post, update_params
			expect(response).to be_success
		end

		it 'returns errors for bad posts updates' do 
			bad_update_params = {
				id: @post1.id
			}
			post :update_post, bad_update_params
			expect(response).to have_http_status(400)
		end

		it 'shows post modal' do
			params = {id: @post1.id}
			get :modal_show, params
		end

		it 'adds good responses' do 
			good_params = {
				author: 'author2@gmail.com',
				id: @post1.id,
				response_type: 'Answer',
				body: 'ANSWERSSSS1'
			}
			post :create_response, good_params
			expect(response).to be_success
		end

		it 'returns error for adding bad responses' do
			bad_params={
				author: 'author2',
				id: @post1.id,
				response_type: 'Answer',
				body: 'ANSWER1'
			}
			post :create_response, bad_params
			expect(response).to have_http_status(400)
		end
	end
end
