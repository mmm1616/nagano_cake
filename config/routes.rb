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
  root  "homes#top"
  end

  scope module: 'public' do
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  
  scope module: 'public' do
      post "orders/confirm", to: "orders#confirm"
      get "orders/complete", to: "orders#complete"
      resources :orders
  end
  
  scope module: 'public' do
    delete '/cart_items/destroy_all', to: "cart_items#destroy_all"
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end
  
  scope module: 'public' do
      get '/customers/mypage', to: "customers#show"
      get '/customers/information/edit', to: "customers#edit"
      patch '/customers/information', to: "customers#update"
      get '/customers/unsubscribe', to: "customers#unsubscribe"
      patch '/customers/withdraw', to: "customers#withdraw"
  end
  
  scope module: 'public' do
      resources :items, only: [:index, :show]
  end
  

  scope module: 'public' do
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
