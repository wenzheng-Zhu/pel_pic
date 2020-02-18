class CarsController < ApplicationController

	def index
		@cars = Car.all
	end

	def new
		@car = Car.new
	end

	def show
		@car = Car.find_by(id: params[:id])
	end

   

	def create
		@car = Car.new(car_params)
		

		@car.save
		
	end


    def edit
    end

	def update
      @car = Car.find_by(id: params[:id])
      @car.update_attributes(car_params)
      	
	end


	def destroy
		@car = Car.find_by(id: params[:id])
		@car.destroy
		
	end



	private

	  def car_params
	  	params.require(:car).permit(:platenumber, :parking_lot_no, :serial_no)
	  end
end
