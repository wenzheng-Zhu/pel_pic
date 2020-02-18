Rails.application.routes.draw do

    devise_for :users
  
	root 'home#index'
	resources :panels
	resources :groups
	resources :ipcs
	resources :nvrs
	resources :profaces
    resources :pragrams
  	resources :items
  	resources :pics
  	resources :videos
  	resources :words

  	namespace 'api' do 
  		namespace 'v1' do

  			resources :pragrams do
          collection do
            get :pic
            get :first_word
            get :second_word
            get :first_video
            get :second_video 
          end 
        end
    
        resources :cars 
        resources :parkingstates  
        

        resources :jiemuzuhe1s
        resources :jiemuzuhe2s
        resources :jiemuzuhe3s
        resources :screens
  		end
  	end

 

end
