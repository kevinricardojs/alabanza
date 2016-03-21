Rails.application.routes.draw do


	resources :cantantes, path: "cantante" do
		resources :albums, path: "album", except: [ :index ]
		resources :songs, path: "cancion", except: [ :index ] do
      resources :acordes
    end
	end

	root 'inicio#index'


end
