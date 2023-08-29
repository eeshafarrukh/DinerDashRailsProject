Rails.application.routes.draw do
  resources  :order_items
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  resource :cart, only: [:show, :update]
  post 'cart/checkout', to: 'cart#checkout', as: 'cart_checkout'
 
  get 'pages/info'
  get 'pages/home'
  devise_for :users
  get 'pages/home'
  get 'menu', to: 'menu#index'
  get '/category/:id', to: 'menu#category', as: 'category'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  resources :cart, only: [:show] do
    collection do
      post :add
      post :remove
    end
  end
  resources :orders do
    member do
      patch 'cancel'
      patch 'mark_as_paid'
      patch 'mark_as_completed'
    end
  end
  resources :orders, only: [:show, :index]

  resource :cart do
    post 'checkout', on: :member
  end
  
end
