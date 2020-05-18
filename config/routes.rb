Rails.application.routes.draw do
  resources :events
  post 'users/sign_out', to: 'users#sign_out'
  post 'users/sign_in', to: 'users#sign_in'
  post '/rsvp', to: 'events#rsvp'
  root 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :create, :new, :login, :logout, :edit, :update]
end
