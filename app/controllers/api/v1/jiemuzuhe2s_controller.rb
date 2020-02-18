module Api
   module V1
      class Jiemuzuhe2sController < ApplicationController
      		def show
      		   @jiemuzuhe2 = Jiemuzuhe2.last
			   render json: { status: 'success', msg: 'load jiemuzuhe2', data: @jiemuzuhe2 }, status: :ok
      	    end
      end
  end
end
