Rails.application.routes.draw do
  
  get 'pages/index'

 devise_for :user2s
  
 root 'pages#index'
 
 
end
