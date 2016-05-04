Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products, only: [:show] do
    resources :comments, only: [:create, :show, :new]
  end
  resource :order, only: [:show, :destroy, :update] do
    patch ':id', action: :create, as: :cart
  end
  get 'categories/(:id)', to: 'products#index', as: :categories
  get 'subcategories/(:subid)', to: 'products#index', as: :subcategories

  root 'products#index'

  namespace :order_admin do
    resources :orders
  end
end
