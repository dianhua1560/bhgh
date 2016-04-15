class PostResponse < ActiveRecord::Base
	belongs_to :post
	has_many :post_response_likes, :dependent => :destroy

	def tojson
		{
			author: self.author,
			body: self.body,
			gravatar: self.gravatar,
			created_at: self.created_at
		}
	end

	def gravatar
		email = self.author ? self.author : 'asdf@gmail.com'
		gravatar_id = Digest::MD5.hexdigest(email.downcase)
		return "http://gravatar.com/avatar/#{gravatar_id}.png"
	end
	

end
