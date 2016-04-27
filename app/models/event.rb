class Event < ActiveRecord::Base
	validates :title, :presence => true
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


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
			location: self.location,
			photo_url: self.avatar.exists? ? self.avatar.url : '',
			title: self.title,
			organizer: self.organizer,
			description:description,
			time: self.time,
			time_string: self.time_string,
			type: 'event',
			gravatar: self.gravatar,
			id: self.id,
			response: response,
			can_edit: true
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

	def num_clicks
		Click.where(path: "/events/click/#{self.id}").length
	end

	def num_responses(response)
		EventResponse.where(event_id: self.id, response: response).length
	end

end
