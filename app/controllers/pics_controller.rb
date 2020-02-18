class PicsController < ApplicationController

	def index
		@pics = Pic.all
	end

	def new
		@pic = Pic.new
	end

   

	def create
		@pic = Pic.new(pic_params)
		

		if @pic.save
			redirect_to pragrams_path, notice: "The pic #{@pic.name} has been uploaded!"
		else
			render 'new'
		end
	end


    def edit
    end

	def update
      @pic = Pic.find_by(id: params[:id])
      if @pic.update_attributes(pic_params)
      	redirect_to pragrams_path
      end
	end


	def destroy
		@pic = Pic.find_by(id: params[:id])
		@pic.destroy
		redirect_to pragrams_path, notice: "The pic #{@pic.name} has been destroyed!!!"
	end



	private

	  def pic_params
	  	params.require(:pic).permit(:name, :attachment, :duration, :type, :item_id)
	  end
end
