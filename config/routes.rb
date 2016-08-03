Rails.application.routes.draw do
    
<<<<<<< HEAD
  #get 'wikis2/index'

  #get 'wikis2/show'

  #get 'wikis2/new'

  #get 'wikis2/edit'
  
  resources wikis2
=======
  #get 'wiki2s/index'

  #get 'wiki2s/show'

  #get 'wiki2s/new'

  #get 'wiki2s/edit'

  resources :wiki2s
>>>>>>> 4a_crud

 devise_for :user2s
 
 get 'pages/index'
  
 root 'pages#index'
 
 
end
