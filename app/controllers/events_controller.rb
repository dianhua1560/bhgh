class EventsController < ApplicationController
   def modal_show
    @event = Event.find(params[:id])
   end

   def list
    render json: Event.all.map{|x| x.tojson(myEmail)}.to_json
   end

   def create
    event = Event.do_new(event_params)
    if event.save
        render json: event.tojson(myEmail), status: 200
    else
        render json: event.errors.to_json, status: 400
    end
   end

   def update
    event = Event.find(params[:id])
    if event.do_update(event_params)
        render json: event.tojson(myEmail), status:200
    else
        render event.errors.to_json, status:400
    end
   end

   def delete
    Event.find(params[:id]).destroy
    render nothing: true, status: 200
   end

   def respond
    EventResponse.where(event_id: params[:id]).where(email: myEmail).destroy_all
    er = EventResponse.create!(event_id: params[:id],email:myEmail, response: params[:response])
    render json: er.response, status: 200
end
   def admin
   end

   private

   def event_params
     params.permit(:title,:description,:time,:organizer,:location)
   end

end
