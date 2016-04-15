class Event < ActiveRecord::Base
	validates :title, :presence => true
	def self.list(myEmail)
		Event.all.map{|x| x.tojson(myEmail)}.to_json
	end
	def self.do_new(params)
		params[:time] = Event.convert_time_string(params[:time])
		return Event.new(params)
	end

	def do_update(params)
		params[:time] = Event.convert_time_string(params[:time])
		return self.update(params)
	end

	def self.convert_time_string(time_string)
		return Time.now
	end

	def photos
		[]
	end


	def tojson(myEmail)
		resp = EventResponse.where(event_id: self.id).where(email: myEmail).first
		response = resp ? resp.response : nil
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
			gravatar: self.gravatar,
			id: self.id,
			response: response
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

	def time_string
		self.time ? self.time.strftime('%B %d, %Y') : ''
	end
end
