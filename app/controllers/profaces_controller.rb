class ProfacesController < ApplicationController

	

	def new
		@proface= Proface.new
	end

	def create
		@proface= Proface.new(proface_params)
		if @proface.save
			redirect_to profaces_path
		end
	end

	def index
		@profaces = Proface.all
	end

	def edit
		@proface = Proface.find_by(id: params[:id])

	end

	def update
		@proface = Proface.find_by(id: params[:id])
		if @proface.update_attributes(proface_params)
			redirect_to profaces_path
		end
	end

	def destroy
		@proface = Proface.find_by(id: params[:id])
		if @proface.destroy
			redirect_to profaces_path
		end
	end


	private

	  def proface_params
	  	params.require(:proface).permit(:name, :pro_ip, :pro_port)
	  end


end
