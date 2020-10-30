class SightingsController < ApplicationController

    def index
        # All attributes of included objects will be listed by default.
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end
    
    def new
    
    end
    
    def create
    
    end
    
    def edit
    
    end
    
    def update
    
    end
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        # render json: sighting, except: [:created_at, :updated_at] 
        # render json: sighting, only: [:bird_id, :location_id]
        
        # include bird and location information in this controller action
        # This produces nested objects in our rendered JSON
        # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location}
        if sighting

        # An alternative is to use the `include` option to indicate what models
        # render json: sighting, include: [:bird, :location], except: [:updated_at, :created_at]

        # remove all instances of `:created_at` and `:updated_at
        render json: sighting.to_json(:include => {
        :bird => {:only => [:name, :species]},
        :location => {:only => [:latitude, :longitude]}
         }, :except => [:updated_at])

        else 
            render json: { message: "You made a wrong turn traveler and now you're gonna pay for it!"}
        end

    end
    
    def destroy
    
    end
end
