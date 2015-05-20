Selfstarter::Application.routes.draw do
  devise_for :admins
  resources :products
  resources :posts
  resources :tenants

  root :to => 'pages#landing_page'
  match '/order'               => 'order#index', :via => [:get,:post]
  match '/checkout'            => 'order#checkout', :via => :get
  match '/subscribe'           => 'order#subscribe', :via => :post
  match '/confirmation'        => 'order#confirmation', :via => [:get]
  match '/order/share/:uuid'   => 'order#share', :via => :get
  match '/order/ipn'           => 'order#ipn', :via => :post
  match '/order/prefill'       => 'order#prefill', :via => [:get,:post]
  match '/order/postfill'      => 'order#postfill', :via => [:get,:post]
end
