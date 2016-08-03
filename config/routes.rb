Rails.application.routes.draw do
    
  #get 'wiki2s/index'

  #get 'wiki2s/show'

  #get 'wiki2s/new'

  #get 'wiki2s/edit'

  resources :wiki2s

 devise_for :user2s
 
 get 'pages/index'
  
 root 'pages#index'
 
 
end
