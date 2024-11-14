Rails.application.routes.draw do
  devise_for :users
  root to: "recos#index"
  resources :recos do
    resources :comments, only: :create
  end
  resources :users, only: :show
  

end
