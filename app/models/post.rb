class Post < ActiveRecord::Base
	has_many :post_responses, :dependent => :destroy
	validates :title, :presence => true
	validates :body, :presence => true
	def self.list(myEmail)
		Post.all.order("created_at desc").map{|x| x.tojson(myEmail)}.to_json
	end
	
	def tojson(myEmail)
		{
			title: self.title,
			id: self.id,
			created_at: self.created_at,
			timestamp: self.timestamp,
			comments: self.comments.map{|x| x.tojson(myEmail)},
			author: self.author,
			gravatar: self.gravatar,
			is_mine: self.is_mine(myEmail),
			body: self.body,
			can_edit: self.can_edit(myEmail)
		}
	end

	def self.do_new(params)
		return Post.new(params)
	end

	def can_edit(myEmail)
		self.author == myEmail or Member.is_admin_email(myEmail)
	end

	def is_mine(myEmail)
		return self.author == myEmail
	end

	def gravatar
		email = self.author ? self.author : 'asdf@gmail.com'
		gravatar_id = Digest::MD5.hexdigest(email.downcase)
		return "http://gravatar.com/avatar/#{gravatar_id}.png"
	end
	
	def comments
		PostResponse.where(post_id: self.id).order('created_at desc').to_a
	end
	
	def timestamp
		self.created_at.in_time_zone('Pacific Time (US & Canada)').strftime("%B %d, %Y at %r")
	end

	def num_clicks
		Click.where(path: "/forum/click/#{self.id}").length
	end
end
