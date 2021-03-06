Rails.application.routes.draw do
  resources :restaurants, except: [:index] do
    resources :reviews, only: [:new, :create]
  end
  root to: 'restaurants#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
