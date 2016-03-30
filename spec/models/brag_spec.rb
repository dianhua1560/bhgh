require 'spec_helper'
require 'rails_helper'

describe Brag do
	describe 'brag' do
		it 'creates brag' do
			Brag.create(
				title: 'valid title',
				author:'a@gmail.com',
				subject:'s@gmail.com',
				body: 'body')
		end
	end
end