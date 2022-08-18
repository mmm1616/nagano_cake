Rails.application.routes.draw do
    
  namespace :admin do
    get 'order_details/update'
  end
  
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  
  namespace :admin do
    resources :customers
  end
  
  namespace :admin do
    resources :genres
  end
  
  namespace :admin do
    resources :items
  end
  
  namespace :admin do
    get '/', to: "homes#top"
  end
  
  namespace :public do
    resources :addresses
  end
  
  namespace :public do
      post "orders/confirm", to: "orders#confirm"
      get "orders/complete", to: "orders#complete"
      resources :orders
  end
  
  namespace :public do
    resources :cart_items do
      delete 'destroy_all'
      end
  end
  
  namespace :public do
    resources :customers do
      get 'unsubscribe'
      patch 'withdraw'
      end
  end
  
  namespace :public do
    resources :items, only: [:index, :show]
  end
  
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  
  devise_for :customers, path: 'customer', controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  
  devise_for :admins, path: 'admin', controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
