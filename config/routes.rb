Rails.application.routes.draw do


  root 'stocks#home'
  resources :stocks, only: :index
  get 'stocks/home'
  
end
