Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "about#index"
  get "questions", to: "questions#index"
  get "account", to: "account#index"
  get '/find', to: 'pages#find', as: 'find'
  get '/find_event', to: 'events#find_event', as: 'find_event'
  # get '/events/:event_number', to: 'events#show', as: 'event'


  resources :events do
    resources :attachments, only: [:new, :create, :index, :destroy]
  end

  resources :attachments, except: [:index, :new, :create, :destroy] do
    resources :comments, only: [:create, :edit, :update]
    resources :likes, only: :create
  end
  resources :comments, only: [:destroy]
  resources :likes, only: :destroy
end
