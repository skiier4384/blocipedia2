Rails.application.routes.draw do
<<<<<<< HEAD
    
<<<<<<< HEAD
<<<<<<< HEAD
  #get 'wikis2/index'

  #get 'wikis2/show'

  #get 'wikis2/new'

  #get 'wikis2/edit'
  
  resources wikis2
=======
=======
  get 'user2s/index'

  get 'user2s/show'

  get 'user2s/new'

  get 'user2s/edit'

>>>>>>> 4a_crud
  #get 'wiki2s/index'

  #get 'wiki2s/show'

  #get 'wiki2s/new'

  #get 'wiki2s/edit'

  resources :wiki2s
>>>>>>> 4a_crud

 devise_for :user2s
 
 get 'pages/index'
  
 root 'pages#index'
 
 
=======
  
  #get 'wikis/index'

  #get 'wikis/show'

  #get 'wikis/edit'

  #get 'wikis/new'
  
  resources :wikis

  devise_for :users
  
  get 'pages/index'

  root 'pages#index'
>>>>>>> 4_crud
end
