Rails.application.routes.draw do

 # root to: 'product_colors#index'
 root 'clients#index'

  resources :product_colors

  resources :clients
  resources :products

 # get "product_colors", to: "product_colors#index"

#  resources :product_sizes

#  resources :product_types
#
 # resources :product_compositions

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
