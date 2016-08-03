Rails.application.routes.draw do
    
  get 'user2s/index'

  get 'user2s/show'

  get 'user2s/new'

  get 'user2s/edit'

  #get 'wiki2s/index'

  #get 'wiki2s/show'

  #get 'wiki2s/new'

  #get 'wiki2s/edit'

  resources :wiki2s

 devise_for :user2s
 
 get 'pages/index'
  
 root 'pages#index'
 
 
end
