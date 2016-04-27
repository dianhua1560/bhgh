class EventsController < ApplicationController
   before_filter :is_admin, :only => [:create]

   def is_admin
        q = Member.where(email: myEmail)
        if q.length == 0 or not q.first.admin?
            render json: 'not authorized', status: 200
        end
    end

    def click
      render nothing: true, status: 200
    end

   def list
    render json: Event.list(myEmail)
   end

   def create
    ep = params[:event]
    ep[:time] = Event.convert_time_string(ep[:time])
    puts ep
    event = Event.new(
      organizer: ep[:organizer],
      description: ep[:description],
      title: ep[:title],
      time: ep[:time],
      location: ep[:location]
      )
    if event.valid?
        event.save!
    else
      flash[:errors] = event.errors.full_messages
      flash[:object_params] = ep
      flash[:error_type] = 'event'
        
    end
    redirect_to '/'
   end

  


   def update
    event = Event.find(params[:id])
    if event.do_update(event_params)
        render json: event.tojson(myEmail), status:200
    else
        render json: event.errors.to_json, status:400
    end
   end

   def delete
    Event.find(params[:id]).destroy
    if request.get?
      redirect_to :back
    else 
      render json: Event.list(myEmail), status: 200
    end
   end

   def respond
    EventResponse.where(event_id: params[:id]).where(email: myEmail).destroy_all
    er = EventResponse.create!(event_id: params[:id],email:myEmail, response: params[:response])
    render json: er.response, status: 200
end
   def admin
   end

   def update_photo
    event = Event.find(params[:id])
    event.avatar = params[:avatar]
    event.save!
    redirect_to '/'
  end


   private

   def event_params
     params.permit(:title,:description,:time,:organizer,:location)
   end

end
