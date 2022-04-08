Rails.application.routes.draw do
  root "products#index"
  
  resources :products
  
  resource :cart, controller: "cart" , only: [:show, :update, :destroy]
  resolve("Cart") { route_for(:cart) }
end
