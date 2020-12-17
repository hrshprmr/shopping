Rails.application.routes.draw do
  devise_for :users
  resources :orders do
    resources :line_items
  end
  resources :products
  root 'products#index'
  get 'line_items/index'

end
