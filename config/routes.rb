Selfstarter::Application.routes.draw do
  devise_for :admins
  resources :products
  resources :posts
  resources :tenants

  root :to => 'pages#vbox'
  match '/order'               => 'order#index', :via => [:get,:post]
  get 'order/checkout'
  match 'order/subscribe'      => 'order#subscribe', :via => :post
  match '/order/share/:uuid'   => 'order#share', :via => :get
  match '/order/ipn'           => 'order#ipn', :via => :post
  match '/order/prefill'       => 'order#prefill', :via => [:get,:post]
  match '/order/postfill'      => 'order#postfill', :via => [:get,:post]
end
