Rails.application.routes.draw do
  root 'users#index'

  get 'register', to: 'users#new'

  resources :users
  resources :departments
end
