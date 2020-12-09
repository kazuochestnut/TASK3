Rails.application.routes.draw do

root to: "home#top"

  get 'home/about'

 # devise_for :users
    devise_for :users, controllers: {
        sessions:      'users/sessions',
        passwords:     'users/passwords',
        registrations: 'users/registrations'
    }
 
 resources :books
 resources :users

 

 
end
