class VideosController < ApplicationController

	

	def new
	   @video = Video.new
	end

	def index
		@video = Video.all
	end

	

    def edit
    	@video = Video.find_by(id: params[:id])
    end

    def update
      @video = Video.find_by(id: params[:id])
      if @video.update_attributes(video_params)
      	redirect_to pragrams_path
      end
	end


	def create
		@video = Video.new(video_params)

		if @video.save
			redirect_to pragrams_path, notice: "The video #{@video.name} has been uploaded!"
		else
			render 'new'
		end
	end


	def destroy
		@video = Video.find_by(id: params[:id])
		@video.destroy
		redirect_to pragrams_path, notice: "The video #{@video.name} has been destroyed!!!"
	end



	private

	  def video_params
	  	params.require(:video).permit(:name, :attachment, :duration, :type, :item_id)
	  end
end

