require 'spec_helper'
require 'rails_helper'


describe Event do
	describe 'event' do
		it 'creates event' do
			Event.create()
		end
	end
end