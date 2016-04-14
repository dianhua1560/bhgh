class Post < ActiveRecord::Base
	has_many :post_responses
	def tojson
		{
			title: self.title,
			author: self.author
		}
	end
	
end
