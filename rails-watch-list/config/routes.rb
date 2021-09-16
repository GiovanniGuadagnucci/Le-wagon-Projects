Rails.application.routes.draw do
  resources :lists, only: [:show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
  root 'lists#index'
end
