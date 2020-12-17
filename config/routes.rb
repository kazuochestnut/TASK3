Rails.application.routes.draw do

root to: "home#top"

  get 'home/about'

 # devise_for :users
    devise_for :users
    # controllers: {
    #     sessions:      'users/sessions',
    #     passwords:     'users/passwords',
    #     registrations: 'users/registrations'
    # }

 resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
 end
 resources :users




end
