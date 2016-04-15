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
			can_edit: true
		}
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
		# if a.length > 1
		# 	return a[-1..1]
		# end
		# if a.length <= 1
		# 	return []
		# end
	end
	
	def timestamp
		self.created_at.in_time_zone('Pacific Time (US & Canada)').strftime("%B %d, %Y at %r")
	end
end
