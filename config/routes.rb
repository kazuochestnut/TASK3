Rails.application.routes.draw do
  root to: "home#top"

  get 'home/about'

   # devise_for :users
        # controllers: {
      #     sessions:      'users/sessions',
      #     passwords:     'users/passwords',
      #     registrations: 'users/registrations'
      # }
  devise_for :users


  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :post_comments, only: [:create, :destroy]
  end

  resources :users do
   member do
     get :following, :followers
    end
  end
  
  get '/search', to: 'search#search'

  resources :relationships, only: [:create, :destroy]


end
