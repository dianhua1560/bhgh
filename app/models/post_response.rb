class PostResponse < ActiveRecord::Base
	belongs_to :post
	has_many :post_response_likes, :dependent => :destroy
	validates :body, :presence => true

	def tojson(myEmail)
		{
			author: self.author,
			body: self.body,
			gravatar: self.gravatar,
			created_at: self.created_at,
			timestamp: self.timestamp
		}
	end

	def gravatar
		email = self.author ? self.author : 'asdf@gmail.com'
		gravatar_id = Digest::MD5.hexdigest(email.downcase)
		return "http://gravatar.com/avatar/#{gravatar_id}.png"
	end

	def timestamp
		self.created_at.in_time_zone('Pacific Time (US & Canada)').strftime("%B %d, %Y at %r")
	end	
end
