Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root "posts#index"
  resources :posts do
    resource :like
  end
end


