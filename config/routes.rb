Rails.application.routes.draw do


  devise_for :customers
  root 'stocks#home'
  resources :stocks
  get 'stocks/home'
  
end
