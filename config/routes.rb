Rails.application.routes.draw do
  resources :events
  post 'users/sign_out', to: 'users#sign_out'
  post 'users/sign_in', to: 'users#sign_in'
  post '/rsvp', to: 'events#rsvp'
  resources :users, only: [:new, :create, :show]
  root 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login' => 'users#login'
  get 'logout' => 'users#logout'
  post 'login' => 'users#login'
  resources :users, only: [:show, :create, :new, :login, :logout]
  root "users#new"
end
