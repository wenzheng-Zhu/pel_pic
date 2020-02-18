module Api
   module V1
      class CarsController < ApplicationController
      		def index
               @cars = []
      		   Car.all.each do |car|
                  if car[:platenumber] != ""
                     @cars << car
                  end
               end
               @cars
			   render json: { status: 'success', msg: 'load cars', data: @cars }, status: :ok
      	    end

      	    def show
      		   @car = Car.find_by(id: params[:id])
			   render json: { status: 'success', msg: 'load car', data: @car }, status: :ok
      	    end

      	    
      end
  end
end