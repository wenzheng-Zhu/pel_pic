class GroupsController < ApplicationController


	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			redirect_to groups_path
		end
	end

	def index
		@groups = Group.all
	end

	def edit
		@group = Group.find_by(id: params[:id])
	end

	def update
		@group = Group.find_by(id: params[:id])
		if @group.update_attributes(group_params)
			redirect_to groups_path
		end
	end


	def destroy
		@group = Group.find_by(id: params[:id])
		if @group.destroy
			redirect_to groups_path
		end
	end



	private

	  def group_params
	  	params.require(:group).permit(:name)
	  end
end
