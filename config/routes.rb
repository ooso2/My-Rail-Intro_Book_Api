Rails.application.routes.draw do
  root 'books#index'

  resources :books do
    resources :reviews, only: [:show, :index]
  end

  resources :authors do
    resources :books, only: [:index]
  end

  resources :subjects do
    resources :books, only: [:index]
  end

  get 'about', to: 'pages#about'
  get 'search', to: 'search#index'
end
