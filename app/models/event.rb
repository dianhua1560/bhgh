class Event < ActiveRecord::Base
	def self.photo_hash
		h = {}
		Photo.where(object_type:'event').all.each do |photo|
			if not h.keys.include?(photo.object_id)
				h[photo.object_id] = []
			end
			h[photo.object_id] << photo
		end
		return h
	end

	def self.click_hash
		clicks = Click.all.select{|x| x.path.include?('/events/show')}
		click_hash = {}
		Event.all.each do |event|
			click_hash[event.id] = clicks.select{|x| x.path == "/events/show/#{event.id}"}
		end
		return click_hash
	end

	def self.response_hash
		responses = EventResponse.all
		going_str = 'Going'
		not_going_str = 'Not Going'
		interested_str = 'Interested'
		r_hash = {}
		Event.all.each do |event|
			resp = responses.select{|x| x.event_id == event.id.to_s}
			going = resp.select{|x| x.response == going_str}.map{|x| x.email}
			not_going = resp.select{|x| x.response == not_going_str}.map{|x| x.email}
			interested = resp.select{|x| x.response == interested_str}.map{|x| x.email}
			r = {
				going_str => going,
				not_going_str => not_going,
				interested_str => interested,
			}
			r_hash[event.id] = r
		end
		return r_hash
	end

	def get_responses(response_hash)
		return response_hash[self.id]
	end
	def has_responses?(response_hash)
		r = response_hash[self.id]
		rs = r['Going'].length + r['Not Going'].length + r['Interested'].length
		return rs != 0
	end
end
