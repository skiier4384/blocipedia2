Rails.application.routes.draw do
    
 devise_for :user2s
 
 get 'pages/index'
  
 root 'pages#index'
 
 
end
