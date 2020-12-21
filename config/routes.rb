Rails.application.routes.draw do
  devise_for :users
  resources :orders do
    resources :line_items
  end
  get '/payment' => 'orders#payment', :as => 'payment_option'
  post 'orders/place_order'
  resources :products
  root 'products#index'
  get 'line_items/index'

end
