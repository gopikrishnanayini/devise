class LocationsController < ApplicationController
	def index
		@event = Event.find(params[:event_id])
		@locations = @event.location
	end
	def new
		@event = Event.find(params[:event_id])
		@location = @event.build_location
	end
	def create
		@event = Event.find(params[:event_id])
		@location = @event.build_location(location_params)
		respond_to do |format| 
			if @location.save
				format.html { redirect_to ([@event, @location]), notice: 'Location was successfully created.' }
				format.json { render json: @location, :status => :created, location: @location }
			else
				format.html { render action: 'new' }
				format.json { render json: @location.errors, :status => :unprocessable_entity }
			end
		end
	end
	def show
		@event = Event.find(params[:event_id])
		@location = @event.location
    end
    def edit
    	@event = Event.find(params[:event_id])
    	@location = @event.location
    end
    def update
    	@event = Event.find(params[:event_id])
    	@location = @event.location
    	respond_to do |format|
    		if @location.update(location_params)
    			format.html { redirect_to ([@event, @location]), notice: 'Location was successfully updated.' }
    			format.json { render json: @location, :status => :updated, location: @location }
    		else
    			format.html { render action: 'update' }
    			format.json { render json: @location.errors, :status => :unprocessable_entity }
    		end
    	end
    end
    def destroy
    	@event = Event.find(params[:event_id])
    	@location = @event.location
    	@location.destroy
    	redirect_to event_locations_path
    end
	private
	def location_params
		params.require(:location).permit(:address)
	end
end