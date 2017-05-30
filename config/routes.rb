Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 resources :users, only: [ :create, :new, :edit, ]  do
    resources :bookings
    resources :hookers
    resources :reviews
  end
end
