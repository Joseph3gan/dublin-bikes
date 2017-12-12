Rails.application.routes.draw do
  
  get 'orderitems/index'

  get 'orderitems/show'

  get 'orderitems/new'

  get 'orderitems/edit'

  resources :orders do 
    resources :orderitems 
  end #allows the app communicate with the db for the required order items
  
  get 'cart/index'

  devise_for :users do
    resources:orders
  end
  
  get '/checkout' => 'cart#createOrder'

  get '/cart/index'
  
  resources :bikes
  
  root 'static_pages#home'
  
  get '/home' => 'static_pages#home'

  get '/about' => "static_pages#about"
  
  get '/contact' => "static_pages#contact"
  
  get '/Admin' => 'user#admin_login'
  get '/logout' => 'user#logout'
  
  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'
  
  get 'cart/remove/:id' => 'cart#remove'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
