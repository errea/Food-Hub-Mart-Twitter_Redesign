Rails.application.routes.draw do
  root to: 'opinions#index'
  resources :users, only: %i[new create edit update]
  resources :opinions, only: [:index, :create] do
  resources :comments, only: [:create]
  end
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'
  post 'opinion', to: 'opinions#create'
  get 'follow', to: 'followings#create'
  post 'follow', to: 'followings#create'
  get 'users/:username', to: 'users#show', as: 'profile'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
