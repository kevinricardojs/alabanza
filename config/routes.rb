Rails.application.routes.draw do
	resources :cantantes do
		resources :albums, except: [ :index ]
		resources :acordes, except: [ :index ]
	end
	
	root 'inicio#index'


end
