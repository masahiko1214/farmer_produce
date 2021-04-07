Rails.application.routes.draw do


  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }
  root 'stocks#home'
  resources :stocks
  get 'stocks/home'
  
end
