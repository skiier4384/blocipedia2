Rails.application.routes.draw do

  resources :charges, only: [:new, :create, :destroy]

  #get 'wikis/index'

  #get 'wikis/show'

  #get 'wikis/edit'

  #get 'wikis/new'
  
  resources :users, only: [:show] do
    post '/downgrade' => 'users#downgrade', as: :downgrade
  end
  
  resources :wikis

  devise_for :users
  
  get 'pages/index'

  root 'pages#index'
  
end
