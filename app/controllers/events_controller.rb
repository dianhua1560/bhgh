class EventsController < ApplicationController
    def index
        @events = Event.all
    end
    
    def new
        @event = Event.new
    end

    def pull_events
    	Event.import
    	redirect_to events_path
    end
end
