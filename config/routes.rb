Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products, only: [:show]
  get 'categories/(:id)', to: 'products#index', as: :categories

  root 'products#index'

end
