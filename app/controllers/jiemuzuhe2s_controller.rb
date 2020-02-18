class Jiemuzuhe2sController < ApplicationController


	def new
		@jiemuzuhe2 = Jiemuzuhe2.new
	end

	def create
		@jiemuzuhe2 = Jiemuzuhe2.new(jiemuzuhe2_params)
		@jiemuzuhe2.save
	end

	def index
		@jiemuzuhe2s = Jiemuzuhe2.all
	end

	def edit
		@jiemuzuhe2 = Jiemuzuhe2.find_by(id: params[:id])
	end

	def update
		@jiemuzuhe2 = Jiemuzuhe1.find_by(id: params[:id])
		@jiemuzuhe2.update_attributes(jiemuzuhe2_params)
	
		
	end


	def destroy
		@jiemuzuhe2 = Jiemuzuhe1.find_by(id: params[:id])
		@jiemuzuhe2.destroy
	end



	private

	  def jiemuzuhe2_params
	  	params.require(:jiemuzuhe2).permit(:video, :duration)
	  end
end
