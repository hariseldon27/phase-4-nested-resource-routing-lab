Rails.application.routes.draw do
  resources :items, only: [:index] do
    resources :users, only: [:index, :show, :create]
  end
  resources :users, only: [:show, :index] do
    resources :items, only: [:index, :show, :create]
  end
end
