Rails.application.routes.draw do
  resources :acordes

	resources :cantantes do
		resources :albums, except: [ :index ]
		resources :songs, except: [ :index ]
	end
	
	root 'inicio#index'


end
