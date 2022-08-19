Rails.application.routes.draw do
    
  namespace :admin do
    resources :order_details, only: [:update]
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
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  
  namespace :public do
      post "orders/confirm", to: "orders#confirm"
      get "orders/complete", to: "orders#complete"
      resources :orders
  end
  
  namespace :public do
      get '/cart_items', to: "cart_items#index"
      patch '/cart_items/:id', to: "cart_items#update"
      delete '/cart_items/:id', to: "cart_items#destroy"
      delete '/cart_items/destroy_all', to: "cart_items#destroy_all"
      post '/cart_items', to: "cart_items#create"
  end
  
  namespace :public do
      get '/customers/mypage', to: "customers#show"
      get '/customers/information/edit', to: "customers#edit"
      patch '/customers/information', to: "customers#update"
      get '/customers/unsubscribe', to: "customers#unsubscribe"
      patch '/customers/withdraw', to: "customers#withdraw"
  end
  
  namespace :public do
      resources :items, only: [:index, :show]
  end
  
  namespace :public do
      root to: "homes#top"
      get '/about', to: "homes#about"
  end
  
  devise_for :customers, path: 'customers', controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  devise_for :admin, skip: [:registrations, :passwords], path: 'admin', controllers: {
  sessions: "admin/sessions"
 }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
