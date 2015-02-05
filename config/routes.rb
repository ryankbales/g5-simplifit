Rails.application.routes.draw do
  mount G5Authenticatable::Engine => '/g5_auth'
  root 'simplifit_users#index'

  get 'register', to: 'simplifit_users#new'

  resources :simplifit_users do
    resources :workouts 
  end

  resources :departments
  resources :workouts
  resources :workout_categories

  #static pages
  get 'about' => 'pages#about'
end
