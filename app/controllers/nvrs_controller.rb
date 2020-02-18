class NvrsController < ApplicationController

	def new
		@nvr = Nvr.new
	end

	def create
		@nvr = Nvr.new(nvr_params)
		if @nvr.save
			redirect_to nvrs_path
		end
	end

	def index
		@nvrs = Nvr.all
	end

	def edit
		@nvr = Nvr.find_by(id: params[:id])
	end

	def update
		@nvr = Nvr.find_by(id: params[:id])
		if @nvr.update_attributes(nvr_params)
			redirect_to nvrs_path
		end
	end

	def destroy
		@nvr = Nvr.find_by(id: params[:id])
		if @nvr.destroy
			redirect_to nvrs_path
		end
	end





	private

	  def nvr_params
	  	params.require(:nvr).permit(:name, :nvr_user, :nvr_port, :password, :nvr_ip)
	  end
end
