Selfstarter::Application.routes.draw do
  resources :plans

  resources :subscriptions

  devise_for :admins
  resources :products
  resources :posts
  resources :tenants

  root :to => 'plans#index'
  match '/checkout'            => 'subscriptions#create', :via => :get
  match '/subscribe'           => 'order#subscribe', :via => :post
  match '/confirmation'        => 'order#confirmation', :via => [:get]
  match '/order/share/:uuid'   => 'order#share', :via => :get
  match '/order/ipn'           => 'order#ipn', :via => :post
  match '/order/prefill'       => 'order#prefill', :via => [:get,:post]
  match '/order/postfill'      => 'order#postfill', :via => [:get,:post]
end
