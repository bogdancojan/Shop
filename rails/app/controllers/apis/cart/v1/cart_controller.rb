class Apis::Cart::V1::CartController < ApplicationController
  def create
    $cart ||= {}
    $cart = session_products
  end

  def show
    @cart_products = []
    $cart.each do |barcode, quantity|
      product = Product.find_by_barcode(barcode)

      @cart_products << get_formated_product(product, quantity)
    end

    render json: @cart_products
  end

  private
  def session_products
    params.require(:cart).permit!
  end

  def get_formated_product(product, quantity)
    formatted_product = {
      id: product.id,
      name: product.name,
      price: product.price,
      barcode: product.barcode,
      photo_url: product.photo_url,
      quantity: quantity
    }
  end
end
