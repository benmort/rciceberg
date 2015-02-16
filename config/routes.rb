Selfstarter::Application.routes.draw do
  devise_for :admins
  resources :products
  resources :tenants

  root :to => 'preorder#index'
  match '/order'               => 'preorder#index', :via => [:get,:post]
  get 'order/checkout'         => 'preorder#checkout', :via => :get
  match '/order/share/:uuid'   => 'preorder#share', :via => :get
  match '/order/ipn'           => 'preorder#ipn', :via => :post
  match '/order/prefill'       => 'preorder#prefill', :via => [:get,:post]
  match '/order/postfill'      => 'preorder#postfill', :via => [:get,:post]
end
