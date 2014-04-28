class EventsController < ApplicationController

    def new
      @event = Event.new
    end

    def create
      @event = Event.new(event_params)
        if @event.valid?
          @event.save
          redirect_to @event
        else
          render :new
        end
    end
    
    def show
      @event = Event.find(params[:id])
    end

    def index
      @events = Event.all
    end

    def edit
      @event = Event.find(params[:id])
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy
    end

    def update
      @event = Event.find(params[:id])
        if @event.update(event_params)
          redirect_to @event
        else
            render 'edit'
        end
    end

    private

    def event_params
      params.require(:event).permit(:name, :genre, :venue, :artist, :date, :time, :url, :email, :description)
    end

end
