module Api
   module V1
      class Jiemuzuhe1sController < ApplicationController

      	def index
      		@jiemuzuhe1s = Jiemuzuhe1.all
      		render json: { status: 'success', msg: 'load jiemuzuhe1s', data: @jiemuzuhe1s }, status: :ok
      	end

      	def show
      		@jiemuzuhe1 = Jiemuzuhe1.last
			   render json: { status: 'success', msg: 'load jiemuzuhe1', data: @jiemuzuhe1 }, status: :ok
      	end

         # def pic
         #    @pragrams = Pic.last
         #    render json: { status: 'sucess', msg: 'load programs', data: @pragrams }, status: :ok
         # end

         # def first_word
         #    @pragrams = Word.first
         #    render json: { status: 'sucess', msg: 'load programs', data: @pragrams }, status: :ok
         # end

         # def second_word
         #     @pragrams = Word.second
         #     render json: { status: 'sucess', msg: 'load programs', data: @pragrams }, status: :ok

         # end 

         # def first_video
         #      @pragrams = Video.first
         #     render json: { status: 'sucess', msg: 'load programs', data: @pragrams }, status: :ok


         # end

         # def second_video
         #    @pragrams = Word.second
         #     render json: { status: 'sucess', msg: 'load programs', data: @pragrams }, status: :ok


         # end

        

         
      
      end
   end
end