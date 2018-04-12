Rails.application.routes.draw do
  devise_for :users

  namespace :account do
    resources :links, except: %i[new]
    resources :dashboard, only: %i[index]
  end

  authenticated :user do
    root 'account/dashboard#index', as: :authenticated_root
  end

  root 'home#index'
end
