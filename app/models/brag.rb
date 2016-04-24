class Brag < ActiveRecord::Base
	validate :subject_and_author_are_emails
	validates :title, :presence => true
	validates :body, :presence => true
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def num_clicks
		Click.where(path: "/brags/click/#{self.id}").length
	end

	def num_likes
		return 0
	end

	def self.list(myEmail)
		Brag.all.map{|x| x.tojson(myEmail)}
	end

	def tojson(myEmail)
		{
			title: self.title,
			time: self.created_at,
			photos: self.photos,
			photo_url: self.avatar.exists? ? self.avatar.url : '',
			author: self.author,
			type: 'brag',
			created_at: self.created_at,
			subject: self.subject,
			gravatar: self.gravatar,
			id: self.id,
			body: self.body,
			liked: BragLike.where(email: myEmail).where(brag_id: self.id).length > 0
		}
	end

	def sort_time
		return self.created_at
	end

	def gravatar
		email = self.author ? self.author : 'asdf@gmail.com'
		gravatar_id = Digest::MD5.hexdigest(email.downcase)
		return "http://gravatar.com/avatar/#{gravatar_id}.png"
	end

	def subject_and_author_are_emails
		if not is_email(subject)
			errors.add(:subject, "must be a valid email address")
		end
		if not is_email(author)
			errors.add(:author, "must be a valid email address")
		end
	end

	def photos
		[]
	end

	def is_email(string)
		Member.is_email(string)
	end

end
