class WordsController < ApplicationController

	def index
		@words = Words.all
	end

	def new
		@word = Word.new
	end

   

	def create
		@word = Word.new(word_params)
		

		if @word.save
			redirect_to pragrams_path, notice: "The word #{@word.name} has been uploaded!"
		else
			render 'new'
		end
	end


    def edit
    	@word = Word.find_by(id: params[:id])
    end

	def update
      @word = Word.find_by(id: params[:id])
      if @word.update_attributes(word_params)
      	redirect_to pragrams_path
      end
	end


	def destroy
		@word = Word.find_by(id: params[:id])
		@word.destroy
		redirect_to pragrams_path, notice: "The word #{@word.name} has been destroyed!!!"
	end



	private

	  def word_params
	  	params.require(:word).permit(:name, :attachment, :duration, :type, :item_id, :content)
	  end
end
