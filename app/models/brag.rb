class Brag < ActiveRecord::Base
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
