class Post < ActiveRecord::Base
	has_many :post_responses, :dependent => :destroy
	def tojson(myEmail)
		{
			title: self.title,
			created_at: self.created_at,
			original: self.original,
			comments: self.comments,
			author: self.author,
			timestamp: self.timestamp
		}
	end

	def original
		PostResponse.where(post_id: self.id).order('created_at asc').first
	end
	
	def comments
		PostResponse.where(post_id: self.id).order('created_at asc').all[1..-1]
	end
	
	def timestamp
		self.created_at.in_time_zone('Pacific Time (US & Canada)').strftime("%B %d, %Y at %r")
	end
end
