Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login' => 'users#login'
  get 'logout' => 'users#logout'
  post 'login' => 'users#login'
  resources :users, only: [:show, :create, :new, :login, :logout]
  root "users#new"
end
