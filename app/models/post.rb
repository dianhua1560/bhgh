class Post < ActiveRecord::Base
	has_many :post_responses, :dependent => :destroy
	validates :title, :presence => true
	def self.list(myEmail)
		Post.all.map{|x| x.tojson(myEmail)}
	end
	
	def tojson(myEmail)
		{
			title: self.title,
			id: self.id,
			created_at: self.created_at,
			original: self.original ? self.original.tojson(myEmail) : {},
			timestamp: self.timestamp,
			comments: self.comments.map{|x| x.tojson(myEmail)},
			author: self.author,
			gravatar: self.gravatar,
			is_mine: self.is_mine(myEmail),
			can_edit: true
		}
	end

	def is_mine(myEmail)
		return self.author == myEmail
	end

	def gravatar
		email = self.author ? self.author : 'asdf@gmail.com'
		gravatar_id = Digest::MD5.hexdigest(email.downcase)
		return "http://gravatar.com/avatar/#{gravatar_id}.png"
	end

	def original
		PostResponse.where(post_id: self.id).order('created_at asc').first
	end
	
	def comments
		PostResponse.where(post_id: self.id).order('created_at asc').to_a
	end
	
	def timestamp
		self.created_at.in_time_zone('Pacific Time (US & Canada)').strftime("%B %d, %Y at %r")
	end
end
