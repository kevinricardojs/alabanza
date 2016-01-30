Rails.application.routes.draw do
	resources :cantantes do
		collection do
   			 get 'new_acorde'
   			 get 'new_album'
  		end
	end
	resources :albums, except: [ :index, :new ]
	resources :acordes, except: [ :index, :new ]
	root 'inicio#index'


end
