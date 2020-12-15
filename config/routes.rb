Rails.application.routes.draw do
  devise_for :users
  resources :products do
  resources :line_items
  end
  root 'products#index'
end
