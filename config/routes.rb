Rails.application.routes.draw do
  get 'login', to: 'sessions#new'

  root 'pages#home'

  get 'pages/home'
  get '/about', to: 'pages#about'


end
