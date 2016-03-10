require 'spec_helper'
require 'rails_helper'

describe Brag do
	describe 'brag' do
		it 'creates brag' do
			Brag.create()
		end
	end
end