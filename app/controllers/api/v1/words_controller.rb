module Api
   module V1
      class WordsController < ApplicationController

      	def index
      		@word = Word.all
      		render json: { status: 'sucess', msg: 'load programs', data: @words }, status: :ok
      	end

      	def show
      		@pragram = Pragram.find_by(id: params[:id])
			   render json: { status: 'success', msg: 'load pragram', data: @pragram }, status: :ok
      	end

         def pic
            @pragrams = Pic.last
            render json: { status: 'sucess', msg: 'load programs', data: @pragrams }, status: :ok
         end

         def first_word
            @pragrams = Word.first
            render json: { status: 'sucess', msg: 'load programs', data: @pragrams }, status: :ok
         end

         def second_word
             @word = Word.second
             render json: { status: 'sucess', msg: 'load programs', data: @word }, status: :ok

         end 

         def first_video
              @pragrams = Video.first
             render json: { status: 'sucess', msg: 'load programs', data: @pragrams }, status: :ok


         end

         def second_video
            @pragram = Video.second
             render json: { status: 'sucess', msg: 'load programs', data: @pragram }, status: :ok


         end

        


      
      end
   end
end