class Event < ActiveRecord::Base

	def self.do_new(params)
		params[:time] = Event.convert_time_string(params[:time])
		return Event.new(params)
	end

	def self.do_update(params)
		params[:time] = Event.convert_time_string(params[:time])
		return Event.update(params)
	end

	def self.convert_time_string(time_string)
		return Time.now
	end

	def photos
		if Event.photo_hash.keys.include?(self.id)
			Event.photo_hash[self.id]
		else
			[]
		end
	end

	def tojson
		{
			time: self.time_string,
			location: self.location,
			photos: self.photos,
			title: self.title,
			organizer: self.organizer,
			description:description,
			time: self.time,
			time_string: self.time_string,
			type: 'event',
			gravatar: self.gravatar
		}
	end


	def gravatar
		email = self.organizer ? self.organizer : 'asdf@gmail.com'
		gravatar_id = Digest::MD5.hexdigest(email.downcase)
		return "http://gravatar.com/avatar/#{gravatar_id}.png"
	end

	def sort_time
		return self.time ? self.time : Time.now
	end

	def self.photo_hash
		Rails.cache.fetch 'event_photo_hash' do
			h = {}
			Photo.where(object_type:'event').all.each do |photo|
				if not h.keys.include?(photo.object_id)
					h[photo.object_id] = []
				end
				h[photo.object_id] << photo
			end
			return h
		end
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

	def time_string
		self.time ? self.time.strftime('%B %d, %Y') : ''
	end
end
