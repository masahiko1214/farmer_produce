Rails.application.routes.draw do


  root 'stocks#home'
  resources :stocks
  get 'stocks/home'
  
end
