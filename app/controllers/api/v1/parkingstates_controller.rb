module Api
   module V1
      class ParkingstatesController < ApplicationController

      	

      	def show
      		@parkingstate = Parkingstate.last
			render json: { status: 'success', msg: 'load parkingstate', data: @parkingstate }, status: :ok
      	end

      
      end
   end
end