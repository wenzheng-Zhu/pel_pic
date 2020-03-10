Rails.application.routes.draw do



  # get 'pelcos/new'
  # get 'pelcos/index'
  # get 'pelcos/show'
  # get 'pelcos/create'
  # get 'pelcos/edit'
  # get 'pelcos/update'
  # get 'pelcos/destroy'
  # get 'sessions/new'
  # get 'sessions/destroy'
  # get 'sessions/create'

  
   root 'home#index'

   get '/signup', to: 'users#new'
   get '/login', to: 'sessions#new'
   delete '/logout', to: 'sessions#destroy'
   post '/login', to: 'sessions#create'

   resources :pelcos
   resources :users
  
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/index'
  # get 'users/destroy'
    # devise_for :users
  
	
	# resources :panels
	# resources :groups
	# resources :ipcs
	# resources :nvrs
	# resources :profaces
 #    resources :pragrams
 #  	resources :items
 #  	resources :pics
 #  	resources :videos
 #  	resources :words

  	# namespace 'api' do 
  	# 	namespace 'v1' do

  	# 		resources :pragrams do
   #        collection do
   #          get :pic
   #          get :first_word
   #          get :second_word
   #          get :first_video
   #          get :second_video 
   #        end 
   #      end
    
   #      resources :cars 
   #      resources :parkingstates  
        

   #      resources :jiemuzuhe1s
   #      resources :jiemuzuhe2s
   #      resources :jiemuzuhe3s
   #      resources :screens
  	# 	end
  	# end

 

end
