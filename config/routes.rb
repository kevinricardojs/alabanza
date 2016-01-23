Rails.application.routes.draw do
	resources :cantantes 
	resources :albums 
	resources :acordes
	root 'inicio#index'


end
