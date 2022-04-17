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

  resource :discount, only: :update
  resolve("Discount") { route_for(:discount) }
end
