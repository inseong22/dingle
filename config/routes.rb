Rails.application.routes.draw do

	resources :users, only: [:new, :create]
	resources :sessions, only: [:new, :create, :destroy]
	resources 'contents'
	
	get '/chart', to: 'contents#chart'
	get '/chart_total', to: 'contents#chart_total'
	get '/mypage', to: 'contents#mypage' 
	
	get '/january', to: 'contents#january'
	get '/february', to: 'contents#february'
	get '/march', to: 'contents#march'
	get '/april', to: 'contents#april'
	get '/may', to: 'contents#may'
	get '/june', to: 'contents#june'
	get '/july', to: 'contents#july'
	get '/august', to: 'contents#august'
	get '/september', to: 'contents#september'
	get '/october', to: 'contents#october'
	get '/november', to: 'contents#november'
	get '/december', to: 'contents#december'
	
	get '/date', to: 'contents#date'
	
	root 'contents#index'
	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
