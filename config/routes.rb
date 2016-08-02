Rails.application.routes.draw do
  
  #get 'wikis/index'

  #get 'wikis/show'

  #get 'wikis/edit'

  #get 'wikis/new'
  
  resources :wikis

  devise_for :users
  
  get 'pages/index'

  root 'pages#index'
end
