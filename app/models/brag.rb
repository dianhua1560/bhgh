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
end
