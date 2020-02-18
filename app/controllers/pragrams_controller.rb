class PragramsController < ApplicationController

	def index
		@pragrams = Pragram.all
		

	end



	def new
		@pragram = Pragram.new
	end


	def create
		@pragram = Pragram.new(pragram_params)
		# @pragram.attachment = params[:file]

		if @pragram.save
			redirect_to pragrams_path
			
		else
			render 'new'
		end
	end


     def edit
     	@pragram = Pragram.find_by(id: params[:id])
     end

     def update
     	@pragram = Pragram.find_by(id: params[:id])
     	if @pragram.update_attributes(pragrams_path)
     		redirect_to pragrams_path
     	end
     end

	def destroy
		@pragram = Pragram.find_by(id: params[:id])
		@pragram.destroy
		redirect_to pragrams_path
	end

	private

	  def pragram_params
	  	params.require(:pragram).permit(:name, :attachment, :duration, :type, :item_id, :sort, :content)
	  end
end
