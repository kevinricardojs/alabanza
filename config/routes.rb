Rails.application.routes.draw do


	resources :cantantes do
		resources :albums, except: [ :index ]
		resources :songs, except: [ :index ] do
      resources :acordes
    end
	end

	root 'inicio#index'


end
