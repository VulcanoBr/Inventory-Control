Rails.application.routes.draw do

  get 'stock_updates/index'
  # get 'adress_suppliers/show'
  root 'homes#index'
  # resources :application
  resources :product_colors
  resources :clients
  resources :products
  resources :suppliers
  resources :product_sizes
  resources :product_types
  resources :product_compositions
  resources :homes
  resources :address_suppliers, only: [:show]
  resources :contact_suppliers, only: [:show]
  resources :address_clients, only: [:show]
  resources :contact_clients, only: [:show]
  resources :stocks
  resources :stock_updates
  resources :stock_entries
  resources :stock_outs
  resources :stock_adjustments, only: [:edit]
  get 'search', to: 'stock_updates#search'
  # get 'clients/masktel'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
