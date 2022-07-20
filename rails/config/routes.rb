Rails.application.routes.draw do
  root "products#index"
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :products
  
  resource :cart, controller: "cart" , only: [:show, :update, :destroy]
  resolve("Cart") { route_for(:cart) }
  delete "/cart/product" => "cart#delete_product"
  patch "/cart/quantity/sub" => "cart#sub_quantity"
  patch "/cart/quantity/add" => "cart#add_quantity"
  post "/cart/checkout" => "cart#checkout"

  resource :discount, only: :update
  resolve("Discount") { route_for(:discount) }

  resources :orders, only: [:create, :index, :show]

  namespace :apis do
    namespace :products do
      namespace :v1 do
        resources :products
      end
    end
    namespace :cart do
      namespace :v1 do
        resource :cart, controller: "cart", only: [:create, :show]
        resource :discounts, controller: "discounts", only: [:update]
      end
    end
    namespace :users do
      namespace :v1 do
        resource :registrations, controller: "registrations", only: [:create, :destroy, :update]
        resource :sessions, controller: "sessions", only: [:create]
      end
    end
    namespace :orders do
      namespace :v1 do
        resources :orders, only: [:index, :create, :show]
      end
    end
  end
end
