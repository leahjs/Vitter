Rails.application.routes.draw do
  root to: 'users#index'
  # get "/profile" => "users#new", :as => :profile

  get "/auth/:provider" => "sessions#create"
  get "/auth/twitter" => "sessions#create"
  get "/auth/twitter/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

  resources :tweets

  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'users/edit'

  get 'users/destroy'

  get 'users/show'

  get 'users/index'

end
