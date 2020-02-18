class ScreensController < ApplicationController

	def new
		@screen = Screen.new
	end

	def create
		@screen = Screen.new(screen_params)
	    @screen.save
	end

	def show
        @screen = Screen.last
	end

	def index
		@scereens = Screen.all
	end

	def update
		@screen = Screen.find_by(id: params[:id])
		@screen.update(screen_params)
		@screen.save
	end


   private

    def screen_params
    	params.require(:screen).permit(:state)
    end


end
