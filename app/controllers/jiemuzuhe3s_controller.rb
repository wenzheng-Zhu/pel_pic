class Jiemuzuhe3sController < ApplicationController


	def new
		@jiemuzuhe3 = Jiemuzuhe3.new
	end

	def create
		@jiemuzuhe3 = Jiemuzuhe3.new(jiemuzuhe3_params)
		@jiemuzuhe3.save
	end

	def index
		@jiemuzuhe3s = Jiemuzuhe3.all
	end

	def edit
		@jiemuzuhe3 = Jiemuzuhe3.find_by(id: params[:id])
	end

	def update
		@jiemuzuhe3 = Jiemuzuhe3.find_by(id: params[:id])
		@jiemuzuhe3.update_attributes(jiemuzuhe3_params)
	
		
	end


	def destroy
		@jiemuzuhe3 = Jiemuzuhe1.find_by(id: params[:id])
		@jiemuzuhe3.destroy
	end



	private

	  def jiemuzuhe3_params
	  	params.require(:jiemuzuhe3).permit(:video, :pic, :video_desc, :pic_desc, :active)
	  end
end
