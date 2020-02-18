class ItemsController < ApplicationController

	def new
		@item = Item.new
	end

	def index
		@items = Item.all
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to items_path
		else
			render 'new'
		end
	end

	def edit
		@item = Item.find_by(id: params[:id])
	end

	def update
		@item = Item.find_by(id: params[:id])
		if @item.update_attributes(item_params)
			redirect_to items_path
		end
	end

	def destroy
		@item = Item.find_by(id: params[:id])
		if @item.destroy
			redirect_to items_path
		end
	end


	private

	  def item_params
	  	params.require(:item).permit(:name, :used, :panel_id)
	  end


end
