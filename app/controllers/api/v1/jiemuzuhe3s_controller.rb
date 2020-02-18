module Api
   module V1
      class Jiemuzuhe3sController < ApplicationController
      		def index
      		   @jiemuzuhe3s = Jiemuzuhe3.all
			   render json: { status: 'success', msg: 'load jiemuzuhe3', data: @jiemuzuhe3s }, status: :ok
      	    end
      end
  end
end
