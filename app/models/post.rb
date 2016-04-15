class Post < ActiveRecord::Base
	has_many :post_responses, :dependent => :destroy
	def self.list(myEmail)
		Post.all.map{|x| x.tojson(myEmail)}
	end
	
	def tojson(myEmail)
		{
			title: self.title,
			id: self.id,
			created_at: self.created_at,
			original: self.original.tojson(myEmail),
			comments: self.comments.map{|x| x.tojson(myEmail)},
			author: self.author
		}
	end

	def original
		PostResponse.where(post_id: self.id).order('created_at asc').first
	end
	
	def comments
		PostResponse.where(post_id: self.id).order('created_at asc').all[1..-1]
	end
	
end
