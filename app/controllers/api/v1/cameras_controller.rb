module Api
   module V1
      class CamerasController < ApplicationController
      		def index
              @cameras = Camera.all    
            end
  end
end