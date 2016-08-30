Rails.application.routes.draw do
  root 'pages#index'
  
  devise_for :users

  resources :charges, only: [:new, :create, :destroy]
  
  resources :users, only: [:show] do
    post '/downgrade' => 'users#downgrade', as: :downgrade
  end
  
  resources :wikis

end
