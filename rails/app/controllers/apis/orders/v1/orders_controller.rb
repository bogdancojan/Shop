class Apis::Orders::V1::OrdersController < ApplicationController
  def index
    orders_for = User.find(params[:user_id])
    
    @orders = []
    orders_for.orders.each do |order|
      @orders << get_formated_order(order)
    end
    render json: @orders
  end

  def show
    @order = Order.find(params[:id])

    array = []
    @order.products.each do |barcode, quantity|
      product = Product.find_by_barcode(barcode)

      array << get_formated_product(product, quantity)
    end

    render json: {
      id: @order.id,
      products: array,
      total_price: @order.total_price,
      discount: @order.discount,
      final_price: @order.final_price,
      created_at: @order.created_at,
      guid: @order.guid 
    }
  end

  private
  def get_formated_product(product, quantity)
    formatted_product = {
      name: product.name,
      price: product.price,
      quantity: quantity
    }
  end

  def get_formated_order(order)
    formatted_order = {
      id: order.id,
      products: order.products,
      total_price: order.total_price,
      discount: order.discount,
      final_price: order.final_price,
      created_at: order.created_at,
      guid: order.guid
    }
  end
end
