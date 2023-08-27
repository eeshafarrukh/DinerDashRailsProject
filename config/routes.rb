Rails.application.routes.draw do
  resources  :order_items
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

 
  get 'pages/info'
  get 'pages/home'
  devise_for :users
  get 'pages/home'
  get 'menu', to: 'menu#index'
  get '/category/:id', to: 'menu#category', as: 'category'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'menu#index'
  resources :cart, only: [:show] do
    collection do
      post :add
      post :remove
    end
  end
end
