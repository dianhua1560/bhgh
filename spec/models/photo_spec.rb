require 'spec_helper'
require 'rails_helper'


describe Photo do
	describe 'photo' do
		it 'creates photo' do
			Photo.create()
		end
	end
end