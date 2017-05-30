Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    resources :bookings
    resources :hookers do
      resources :reviews, only: [ :create, :new ]
      resources :bookings
    end
    resources :reviews, only: [ :show, :update, :edit, :destroy ]

end
