class ZhengController < ApplicationController

	def index
		@items = Item.all
	end

end
