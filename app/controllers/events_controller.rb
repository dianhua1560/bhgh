class EventsController < ApplicationController
    def index
        @events = Event.all.order('time desc')
        @responses = EventResponse.where(email: myEmail)
        a_ids = @responses.select{|x| x.response == 'Going'}.map{|x| x.event_id.to_i}
        @attending = @events.select{|e| a_ids.include?(e.id)}
        @responses = @responses.index_by(&:event_id)
        @responded_ids = @responses.keys.map{|x| x}
        @is_admin = current_member ? current_member.admin? : false
        @photos = Event.photo_hash
    end

    def show
        @event = Event.find(params[:id])
        @photos = Photo.where(object_type: 'event', object_id: @event.id)
    end
    
    def new
        @event = Event.new
        render :edit
    end

    def edit
        @editing = true
        @event = Event.find(params[:id])
        @photo_urls = Photo.where(
            object_type: 'event',
            object_id: @event.id
            ).map{|x| x.url}
        render :edit
    end

    def update
        if params[:id] and params[:id] != ''
            @event = Event.find(params[:id])
        else
            @event = Event.new
        end
        @event.title = params[:title]
        @event.description = params[:description]
        @event.time = params[:time].present? ? DateTime.strptime(params[:time], '%B %d, %Y') : nil
        @event.location = params[:location]
        @event.organizer = params[:organizer] != '' ? params[:organizer] : myEmail
        @event.save
        Photo.where(
            object_type:'event',
            object_id: @event.id).destroy_all
        params[:photos].split(',').each do |photo_url|
            Photo.where(
                object_type:'event',
                object_id: @event.id,
                url: photo_url.strip).first_or_create!
        end
        redirect_to events_path
    end

    def admin
        @events = @events = Event.all.order('time desc')
        @click_hash = Event.click_hash
        @response_hash = Event.response_hash
    end

    def delete
        Event.find(params[:id]).destroy
        redirect_to :back
    end

    def respond
        response = EventResponse.where(event_id: params[:id],
            email: myEmail).first_or_create!
        response.response = params[:response]
        response.save
        redirect_to events_path
    end

    def delete_response
        response = EventResponse.find(params[:id]).destroy
        redirect_to events_path
    end
end
