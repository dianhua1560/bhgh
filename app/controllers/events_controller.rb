class EventsController < ApplicationController
    def index
        @events = Event.all.paginate(:page => params[:page])
        @responses = EventResponse.where(email: myEmail).index_by(&:event_id)
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
        @event = Event.find(params[:id])
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
        @event.time = Time.new(params[:time])
        @event.organizer = myEmail
        @event.save
        redirect_to events_path
    end

    def admin
        @events = Event.all
    end

    def delete
        Event.find(params[:id]).destroy
        redirect_to events_admin_path
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
