class Brag < ActiveRecord::Base
	validate :subject_and_author_are_emails
	validates :title, :presence => true
	validates :body, :presence => true


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
		h = {}
		Photo.where(object_type:'brag').all.each do |photo|
			if not h.keys.include?(photo.object_id)
				h[photo.object_id] = []
			end
			h[photo.object_id] << photo
		end
		return h
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
