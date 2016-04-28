class Event < ActiveRecord::Base
	validates :title, :presence => true
	validates :description, :presence => true
	validate :organizer_is_email
	validates :location, :presence => true
	validates :time, :presence => true
	# validate :time_format_correct

	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def organizer_is_email
		if not Member.is_email(self.organizer)
			errors.add(:organizer, "Must be valid email address")
		end
	end

	def self.list(myEmail)
		Event.all.map{|x| x.tojson(myEmail)}.to_json
	end

	def do_update(params)
		params[:time] = Event.convert_time_string(params[:time])
		return self.update(params)
	end

	def self.convert_time_string(time_string)
		begin
			return Time.strptime(time_string, "%B %e, %Y")
		rescue
			return nil
		end
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
			can_edit: Member.is_admin_email(myEmail)
		}
	end

	def gravatar
		email = self.organizer ? self.organizer : 'asdf@gmail.com'
		gravatar_id = Digest::MD5.hexdigest(email.downcase)
		return "http://gravatar.com/avatar/#{gravatar_id}.png"
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
