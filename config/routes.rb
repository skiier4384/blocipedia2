Rails.application.routes.draw do
    
  #get 'wikis2/index'

  #get 'wikis2/show'

  #get 'wikis2/new'

  #get 'wikis2/edit'
  
  resources wikis2

 devise_for :user2s
 
 get 'pages/index'
  
 root 'pages#index'
 
 
end
