Rails.application.routes.draw do
  

  root 		'pages#home'

  get 		'pages/home'
  get 		'/about', 		to: 'pages#about'
  get 		'login', 			to: 'sessions#new'
  post		'login', 			to: 'sessions#create'
  delete	'logout', 		to: 'sessions#destroy'

  resources :users
  resources :posts, only: [:new, :create, :index, :destroy]
end
