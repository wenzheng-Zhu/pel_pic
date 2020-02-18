class IpcsController < ApplicationController

	def new
		@ipc = Ipc.new
	end

	def create
		@ipc = @ipc = Ipc.new(ipc_params)
		if @ipc&.save
			redirect_to ipcs_path
		else
			render 'new'
		end
	end

	def index
		@ipcs = Ipc.all
	end


	def edit
		@ipc = Ipc.find_by(id: params[:id])
	end

	def update
		@ipc = Ipc.find_by(id: params[:id])
		if @ipc.update_attributes(ipc_params)
			redirect_to ipcs_path
		end
	end

	def destroy
		@ipc = Ipc.find_by(id: params[:id])
		if @ipc.destroy
			redirect_to ipcs_path
		end
	end



	private

	  def ipc_params
	  	params.require(:ipc).permit(:name, :path_no, :canshu, :nvr_id, :panel_id)
	  end
end
