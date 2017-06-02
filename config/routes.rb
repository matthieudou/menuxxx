Rails.application.routes.draw do


  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :bookings, only: [] do
      collection do
        get :all_bookings
      end
    end

    resources :hookers do
      resources :reviews, only: [ :create ]
      resources :bookings
    end
    resources :reviews, only: [ :show, :update, :edit, :destroy ]

end
