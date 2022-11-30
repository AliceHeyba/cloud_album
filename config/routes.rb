Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :events do
    resources :attachments, only: [:new, :create, :index]
  end

  resources :attachments, except: [:index, :new, :create] do
    resources :comments, only: :create
    resources :likes, only: :create
  end
  resources :comments, only: [:edit, :update, :destroy]
  resources :likes, only: :destroy
end
