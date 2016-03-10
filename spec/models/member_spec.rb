require 'spec_helper'
require 'rails_helper'


describe Member do
	describe 'member' do
		it 'creates member' do
			Member.create()
		end
	end
end