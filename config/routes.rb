Rails.application.routes.draw do
  resources :registrations
  resources :logins
  resources :posts, only: [:edit, :update, :new, :create]
  get 'posts/index', to: 'posts#index'
  get  '/posts/:id', to: 'posts#show'
  post '/posts/new', to: 'posts#create'
  # get 'dashboards/index', as: :dashboards
 
end
