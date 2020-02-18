module Api
   module V1
      class ScreensController < ApplicationController

      	def index
      		@screens = Screen.all
      		render json: { status: 'success', msg: 'load screens', data: @screens }, status: :ok
      	end

      	def show
      		@screen = Screen.last
			render json: { status: 'success', msg: 'load screen', data: @screen }, status: :ok
      	end

      
      end
   end
end