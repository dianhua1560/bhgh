class Brag < ActiveRecord::Base
	validate :subject_and_author_are_emails
	validates :title, :presence => true
	validates :body, :presence => true

	def self.list(myEmail)
		Brag.all.map{|x| x.tojson(myEmail)}
	end

	def tojson(myEmail)
		{
			title: self.title,
			time: self.created_at,
			photos: self.photos,
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

	def photos
		p = Brag.photo_hash[self.id]
		p = p ? p : []
		p = p.map{|x| x.url}
		return p
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
		email_set = [".edu", ".com", ".org", ".net"]
		return email_set.include? string[-4..-1]
	end

	def self.photo_hash
		Rails.cache.fetch 'brag_photo_hash' do
			h = {}
			Photo.where(object_type:'brag').all.each do |photo|
				if not h.keys.include?(photo.object_id)
					h[photo.object_id] = []
				end
				h[photo.object_id] << photo
			end
			return h
		end
	end

	def self.click_hash
		clicks = Click.all.select{|x| x.path.include?('/brags/show')}
		click_hash = {}
		Brag.all.each do |brag|
			click_hash[brag.id] = clicks.select{|x| x.path == "/brags/show/#{brag.id}"}
		end
		return click_hash
	end
end
