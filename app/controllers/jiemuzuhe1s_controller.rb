class Jiemuzuhe1sController < ApplicationController


	def new
		@jiemuzuhe1 = Jiemuzuhe1.new
	end

	def create
		@jiemuzuhe1 = Jiemuzuhe1.new(jiemuzuhe1_params)
		@jiemuzuhe1.save
	end

	def index
		@jiemuzuhe1s = Jiemuzuhe1.all
	end

	def edit
		@jiemuzuhe1 = Jiemuzuhe1.find_by(id: params[:id])
	end

	def update
		@jiemuzuhe1 = Jiemuzuhe1.find_by(id: params[:id])
		@jiemuzuhe1.update_attributes(jiemuzuhe1_params)
	
		
	end


	def destroy
		@jiemuzuhe1 = Jiemuzuhe1.find_by(id: params[:id])
		@jiemuzuhe1.destroy
	end



	private

	  def jiemuzuhe1_params
	  	params.require(:jiemuzuhe1).permit(:video1, :video2, :desc, :command_type)
	  end
end
