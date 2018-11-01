Rails.application.routes.draw do
  

  root 		'posts#index'

  get 		'pages/home'
  get 		'/about', 		to: 'pages#about'
  get 		'login', 			to: 'sessions#new'
  post		'login', 			to: 'sessions#create'
  delete	'logout', 		to: 'sessions#destroy'
  get     'users/:id/posts',	to: 'users#posts', as: :users_posts

  resources :users
  resources :posts, only: [:new, :create, :index, :destroy]
end
