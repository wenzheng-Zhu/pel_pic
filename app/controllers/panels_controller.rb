class PanelsController < ApplicationController

	def new
		@panel = Panel.new
	end

	def create
		@panel = Panel.new(panel_params)
		if @panel.save
			redirect_to panels_path
		end
	end

	def index
		@panels = Panel.all
	end

	def edit
		@panel = Panel.find_by(id: params[:id])
	end

	def update
		@panel = Panel.find_by(id: params[:id])
		if @panel.update_attributes(panel_params)
			redirect_to panels_path
		end
	end

	def destroy
		@panel = Panel.find_by(id: params[:id])
		if @panel.destroy
			redirect_to panels_path
		end
	end



	private

	  def panel_params
	  	params.require(:panel).permit(:name, :ip, :group_id, :proface_id)
	  end

end
