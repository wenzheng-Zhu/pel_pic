class ParkingstatesController < ApplicationController

	def new
		@parkingstate = Parkingstate.new
	end

	def create
		@parkingstate = Parkingstate.new(parkingstate_params)
	    @parkingstate.save
	end

	def index
		@parkingstates = Parkingstate.all
	end

	def show
        @parkingstate = Parkingstate.last
	end


   private

    def parkingstate_params
    	params.require(:parkingstate).permit(:screen_desc)
    end


end
