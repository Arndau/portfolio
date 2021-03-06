Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :users do
    resources :projects
  end
  resources :contacts, only: [:new, :create]
end
